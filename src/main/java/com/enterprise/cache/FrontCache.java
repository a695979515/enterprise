package com.enterprise.cache;

import com.enterprise.entity.*;
import com.enterprise.entity.page.PageModel;
import com.enterprise.service.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.enterprise.core.SystemManage;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;


public class FrontCache implements ServletContextAware {
	private static SystemManage systemManage;
	@Autowired
	private SystemSettingService systemSettingService;
	@Autowired
	private RecruitmentService recruitmentService;
	@Autowired
	private FriendLinksService friendLinksService;
	@Autowired
	private IndexImgService indexImgService;
    @Autowired
    private MessageService messageService;
	@Autowired
	private ArticleCategoryService articleCategoryService;
	@Autowired
	private ContactService contactService;
	@Autowired
	private AboutService aboutService;
	@Autowired
	private ServiceService serviceService;

	@Autowired
    public void setSystemManage(SystemManage systemManage) {
        FrontCache.systemManage = systemManage;
    }

	private ServletContext servletContext;
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	/**
	 * 载入全部缓存
	 * @throws Exception
	 */
	public void loadAllCache() throws Exception{
		loadFriendLinks();
		loadSystemSetting();
		loadRecruitments();
		loadIndexImg();
        loadMessage();
		loadArticleCategroy();
		loadContact();
		loadAbout();
		loadService();
	}
	/**
	 * 加载系统设置缓存
	 * @throws Exception
     */
	public void loadSystemSetting() throws  Exception{
		SystemSetting systemSetting = systemSettingService.selectOne(new SystemSetting());
		if (systemSetting == null) {
			throw new NullPointerException("未设置系统变量，请管理员在后台进行设置");
		}
		systemSetting.setServerInfo(servletContext.getServerInfo());
		systemSetting.setServerVersion(servletContext.getMajorVersion()+"."+servletContext.getMinorVersion());
		systemSetting.setJavaVersion(System.getProperty("java.version"));
		systemSetting.setJavaHome(System.getProperty("java.home"));
		systemSetting.setOsName(System.getProperty("os.name"));
		systemSetting.setOsVersion(System.getProperty("os.version"));
		systemSetting.setMysqlVersion(systemSettingService.selectVersion());
		systemManage.setSystemSetting(systemSetting);
	}
	/**
	 * 加载友情链接缓存
	 * @throws Exception
	 */
	public void loadFriendLinks() throws Exception{
		List<FriendLinks> friendLinksList = friendLinksService.selectList(new FriendLinks());
		systemManage.setFriendLinks(friendLinksList);
	}

	/**
	 * 加载招聘信息缓存
	 * @throws Exception
     */
	public void loadRecruitments() throws Exception{
		Recruitment e = new Recruitment();
		e.setStatus("y");
		List<Recruitment> recruitmentList = recruitmentService.selectList(e);
		systemManage.setRecruitments(recruitmentList);
	}

	/**
	 * 加载门户图片缓存
	 * @throws Exception
     */
	public void loadIndexImg() throws Exception{
		IndexImg indexImg = new IndexImg();
		indexImg.setStatus("y");
		List<IndexImg> indexImgs = indexImgService.selectList(indexImg);
		systemManage.setIndexImgs(indexImgs);
	}

    /**
     * 加载最近的五条留言
     * @throws Exception
     */
    public void loadMessage() throws Exception{
        Messages messages = new Messages();
        messages.setOffset(0);
        messages.setPageSize(5);
        PageModel page = messageService.selectPageList(messages);
        systemManage.setMessages(page.getList());
    }

	/**
	 * 加载文章分类
	 * @throws Exception
     */
	public void loadArticleCategroy() throws Exception{
		List<ArticleCategory> articleCategoryLIst = new ArrayList<ArticleCategory>();
		articleCategoryLIst = articleCategoryService.selectList(new ArticleCategory());
		systemManage.setArticleCategory(articleCategoryLIst);
	}

	/**
	 * 加载联系我们
	 * @throws Exception
     */
	public void loadContact() throws Exception{
		List<Contact> contacts = new ArrayList<Contact>();
		contacts = contactService.selectList(new Contact());
		systemManage.setContact(contacts);
	}
	/**
	 * 加载关于我们
	 * @throws Exception
     */
	public void loadAbout() throws Exception{
		List<About> abouts = new ArrayList<About>();
		abouts = aboutService.selectList(new About());
		systemManage.setAbout(abouts);
	}

	/**
	 * 加载服务领域
	 * @throws Exception
     */
	public void loadService() throws Exception{
		List<Service> services = new ArrayList<Service>();
		services = serviceService.selectList(new Service());
		systemManage.setService(services);
	}


}
