package com.enterprise.controller.manage;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.enterprise.entity.Systemlog;
import com.enterprise.service.MenuService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.enterprise.entity.Menu;
import com.enterprise.entity.MenuItem;
import com.enterprise.entity.User;
import com.enterprise.service.Services;
import com.enterprise.service.impl.UserServiceImpl;
import com.enterprise.service.SystemlogService;
import com.enterprise.util.AddressUtil;
import com.enterprise.util.MD5;
import com.enterprise.util.RequestHolder;
import com.enterprise.controller.BaseController;
/**
 * 用户登录、登出、信息操作
 * @author Cesiumai
 *
 */
@Controller
@RequestMapping("/manage/user/")
public class UserAction extends BaseController<User> {

	private static final long serialVersionUID = 1L;

	private static final String page_input = "/manage/system/login";// 登录页面
	private static final String page_home = "/manage/system/home";// 后台主页
	private static final String page_toList = "/manage/system/user/userList";// 后台用户列表页
	private static final String page_toAdd = "/manage/system/user/editUser";// 添加用户页面
	private static final String page_toEdit = "/manage/system/user/editUser";// 编辑用户页面
	private static final String page_info = "/manage/system/user/info";//个人用户信息
	private static final String page_changePwd_result = "/manage/system/user/changePwd";//修改密码成功

	public UserAction() {
		super.page_toEdit = page_toEdit;
		super.page_toList = page_toList;
		super.page_toAdd = page_toAdd;
	}


	@Autowired
	private UserServiceImpl userServiceImpl;
	@Autowired
	private MenuService menuService;
	@Autowired
	private SystemlogService systemlogService;

	@Override
	public Services<User> getService() {
		return userServiceImpl;
	}

	public UserServiceImpl getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(UserServiceImpl userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

	@Override
	public void insertAfter(User e) {
		e.clear();
	}

	/**
	 * 转到登录页面
	 * 
	 * @param e
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@ModelAttribute("e") User e, HttpSession session,HttpServletRequest request) {
		if (session.getAttribute("manage_session_user_info") != null) {
			return "redirect:/manage/user/home";
		}
		/**
		 * 判断没有cookie
		 */
		Cookie[] cookies = request.getCookies();
		Cookie sCookie=null;
		String username = null;
		String password = null;
		if(cookies!=null && cookies.length>0){
			for(int i = 0; i<cookies.length;i++){
				sCookie = cookies[i];
				if(sCookie!=null){
					if(StringUtils.equals(sCookie.getName(), "manage_cookie_username")){
						username = sCookie.getValue();
					}
					if(StringUtils.equals(sCookie.getName(), "manage_cookie_password")){
						password = sCookie.getValue();
					}
				}
			}
		}
		if(username!=null && password!=null&&session.getAttribute("manage_session_user_info")==null){
			e.setUsername(username);
			e.setPassword(password);
			e = userServiceImpl.login(e);
			session.setAttribute("manage_session_user_info", e);
			Collection<MenuItem> userMenus = loadMenus();
			session.setAttribute("userMenus", userMenus);
			return "redirect:/manage/user/home";
		}
		return page_input;
	}

	/**
	 * 登录方法
	 * 
	 * @param session
	 * @param e
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpSession session,HttpServletResponse response, @ModelAttribute("e") User e, ModelMap model) throws Exception {
		String remember = RequestHolder.getRequest().getParameter("remember");
		String errorMsg;
		if (session.getAttribute("manage_session_user_info") != null) {
			return "redirect:/manage/user/home";
		}
		if (StringUtils.isBlank(e.getUsername()) || StringUtils.isBlank(e.getPassword())) {
			model.addAttribute("errorMsg", "用户名和密码不能为空");
			return page_input;
		}
		if(StringUtils.isBlank(e.getManage_vcode())){
			model.addAttribute("errorMsg", "验证码不能为空");
			return page_input;
		}
		String manage_vcode = RequestHolder.getSession().getAttribute("validateCode").toString();
		if(StringUtils.isNotBlank(manage_vcode)&&!(manage_vcode.toLowerCase()).equals(e.getManage_vcode().toLowerCase())){
			model.addAttribute("errorMsg", "验证码错误");
			return page_input;
		}
		e.setPassword(MD5.md5(e.getPassword()));
		User u = userServiceImpl.login(e);
		if (u == null) {
			errorMsg = "登录失败，用户名和密码不符";
			model.addAttribute("errorMsg", errorMsg);
			return page_input;
		}
		if(StringUtils.isNotBlank(remember)){
			Cookie usernameCookie = new Cookie("manage_cookie_username", e.getUsername());
			Cookie passwordCookie = new Cookie("manage_cookie_password", e.getPassword());
			usernameCookie.setMaxAge(60*60*24*7);	//七天
			passwordCookie.setMaxAge(60*60*24*7);	//七天
			response.addCookie(usernameCookie);
			response.addCookie(passwordCookie);
		}
		session.setAttribute("manage_session_user_info", u);
		Collection<MenuItem> userMenus = loadMenus();
		session.setAttribute("userMenus", userMenus);
		try {
			insertLog(u, "login");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "redirect:/manage/user/home";
	}

	/**
	 * 主页面
	 * @return
     */
	@RequestMapping("home")
	public String home() {
		return page_home;
	}

	/**
	 * 加载后台菜单
	 * 
	 * @return
	 */
	public Collection<MenuItem> loadMenus() {
		Map<String, String> param = new HashMap<String, String>();

		List<Menu> menus = menuService.selectList(param);
		LinkedHashMap<String, MenuItem> root = new LinkedHashMap<String, MenuItem>();
		for (Menu menu : menus) {
			MenuItem item = new MenuItem(menu.getName(), null);
			item.setId(String.valueOf(menu.getId()));
			item.setPid(menu.getPid());
			item.setIcon(menu.getIcon());
			item.setUrl(StringUtils.trim(menu.getUrl()));
			if (item.isRootMenu()) {
				root.put(item.getId(), item);
			}
		}
		for (Menu menu : menus) {
			MenuItem item = new MenuItem(menu.getName(), null);
			item.setId(String.valueOf(menu.getId()));
			item.setPid(menu.getPid());
			item.setIcon(menu.getIcon());
			item.setUrl(StringUtils.trimToEmpty(menu.getUrl()));
			if (!item.isRootMenu() && !item.isButton()) {
				MenuItem parentItem = root.get(item.getPid());
				if (parentItem != null) {
					parentItem.addChildren(item);
				}
			}
		}
		return root.values();
	}

	/**
	 * 登出
	 * 
	 * @param e
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("logout")
	public String logout(@ModelAttribute("e") User e,HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = RequestHolder.getSession();
		if (session != null) {
			User u = (User) RequestHolder.getSession().getAttribute("manage_session_user_info");
			if (u != null && StringUtils.isNotBlank(u.getUsername())) {
				insertLog(u, "loginOut");
			}
			session.setAttribute("manage_session_user_info", null);
		}
		Cookie[] cookies = request.getCookies();
		if (cookies != null || cookies.length > 0) {
			for(Cookie cookie:cookies){
				if(StringUtils.equals(cookie.getName(), "manage_cookie_username")){
		            cookie.setMaxAge(0);
		            response.addCookie(cookie);
				}
				if(StringUtils.equals(cookie.getName(), "manage_cookie_password")){
					cookie.setMaxAge(0);
		            response.addCookie(cookie);
				}
			}
	    }
		e.clear();
		return page_input;
	}



	/**
	 * 编辑
	 */
	@RequestMapping("toEdit")
	@Override
	public String toEdit(@ModelAttribute("e") User e, ModelMap model) throws Exception {
		e = userServiceImpl.selectOne(e);
		model.addAttribute("e", e);
		return page_toEdit;
	}

	/**
	 * 添加
	 */
	@RequestMapping("toAdd")
	@Override
	public String toAdd(@ModelAttribute("e") User user, ModelMap model) throws Exception {
		return page_toAdd;
	}

	/**
	 * 增加或修改
	 * 
	 * @param e
	 * @param model
	 * @param flushAttrs
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "insertOrUpdate", method = RequestMethod.POST)
	public String insertOrUpdate(@ModelAttribute("e") User e, ModelMap model, RedirectAttributes flushAttrs)
			throws Exception {
		User user = (User) RequestHolder.getSession().getAttribute("manage_session_user_info");
		if (e.getId() == 0) {// 添加
			if (StringUtils.isBlank(e.getPassword()) || StringUtils.isBlank(e.getNewpassword2())) {
				flushAttrs.addFlashAttribute("errorMsg", "输入的密码不符合要求！");
				return "redirect:toEdit?id=" + e.getId();
			}

			if (!e.getPassword().equals(e.getNewpassword2())) {
				flushAttrs.addFlashAttribute("errorMsg", "两次输入的密码不一致！");
				return "redirect:toEdit?id=" + e.getId();
			}
			e.setCreateAccount(user.getUsername());
			e.setPassword(MD5.md5(e.getPassword()));
			getService().insert(e);
		} else {// 修改
			if (StringUtils.isBlank(e.getPassword()) && StringUtils.isBlank(e.getNewpassword2())) {
				// 不修改密码
				e.setPassword(null);
			} else {
				// 修改密码
				if(StringUtils.isBlank(e.getOldPassword())){
					flushAttrs.addFlashAttribute("errorMsg", "修改密码原始密码不能为空");
					return "redirect:toEdit?id=" + e.getId();
				}
				if (!MD5.md5(e.getOldPassword()).equals(user.getPassword())) {
					flushAttrs.addFlashAttribute("errorMsg", "原密码不正确");
					return "redirect:toEdit?id=" + e.getId();
				}
				if (!e.getNewpassword().equals(e.getNewpassword2())) {
					flushAttrs.addFlashAttribute("errorMsg", "两次输入的密码不一致！");
					return "redirect:toEdit?id=" + e.getId();
				}
				e.setPassword(MD5.md5(e.getNewpassword()));
			}

			e.setUpdateAccount(user.getUsername());
			getService().update(e);
			if(StringUtils.isNotBlank(e.getPassword())) {
				return page_changePwd_result ;
			}
		}
		flushAttrs.addFlashAttribute("message", "操作成功!");
		return "redirect:back";
	}




	/**
	 * 管理员个人信息
	 * 
	 * @param e
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("info")
	public String info(@ModelAttribute("e") User e, HttpServletRequest request, ModelMap model) {
		if (StringUtils.isBlank(request.getParameter("id"))) {
			throw new NullPointerException("非法请求！");
		}
		int id = Integer.parseInt(request.getParameter("id"));
		e.setId(id);
		e = getService().selectOne(e);
		model.addAttribute("e", e);
		return page_info;
	}

	/**
	 * 添加日志
	 * 
	 * @param u
	 * @param log
	 */
	private void insertLog(User u, String log) {
		Systemlog systemlog = new Systemlog();
		systemlog.setTitle(log);
		systemlog.setContent(log);
		systemlog.setAccount(u.getUsername());
		systemlog.setType(1);
		systemlog.setLoginIp(AddressUtil.getIp(RequestHolder.getRequest()));

		String address = null;
		if (!systemlog.getLoginIp().equals("127.0.0.1") && !systemlog.getLoginIp().equals("localhost")) {
			// 获取指定IP的区域位置
			try {
				address = AddressUtil.getAddress("ip=" + systemlog.getLoginIp(), "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
			systemlog.setLoginArea(address);

			// 异地登陆的判断方法为：先比较本次登陆和上次登陆的区域位置，如果不一致，说明是异地登陆；如果获取不到区域，则比较IP地址，如果IP地址和上次的不一致，则是异地登陆
			Systemlog firstSystemlog = systemlogService.selectFirstOne(u.getUsername());
			if (firstSystemlog != null) {
				if (StringUtils.isNotBlank(address) && StringUtils.isNotBlank(firstSystemlog.getLoginArea())) {
					if (!address.equals(firstSystemlog.getLoginArea())) {
						systemlog.setDiffAreaLogin(Systemlog.systemlog_diffAreaLogin_y);
					}
				} else if (StringUtils.isNotBlank(systemlog.getLoginIp())
						&& StringUtils.isNotBlank(firstSystemlog.getLoginIp())) {
					if (!systemlog.getLoginIp().equals(firstSystemlog.getLoginIp())) {
						systemlog.setDiffAreaLogin(Systemlog.systemlog_diffAreaLogin_y);
					}
				}
			}
		}
		systemlogService.insert(systemlog);
	}

	/**
	 * 删除
	 * @param request
	 * @param user
	 * @param flushAttrs
	 * @return
     * @throws Exception
     */
	@RequestMapping("delete")
	public String update(HttpServletRequest request, @ModelAttribute("e") User user, RedirectAttributes flushAttrs) throws Exception {
		userServiceImpl.delete(user);
		addMessage(flushAttrs,"操作成功！");
		return "redirect:selectList";
	}

	/**
	 * 上传头像
	 *
	 * @param request
	 * @param x
	 * @param y
	 * @param h
	 * @param w
	 * @param imageFile
     * @return
     * @throws Exception
     */
	@RequestMapping(value = "/uploadHeadImage")
	public String uploadHeadImage(
			HttpServletRequest request,
			@RequestParam(value = "x") String x,
			@RequestParam(value = "y") String y,
			@RequestParam(value = "h") String h,
			@RequestParam(value = "w") String w,
			@RequestParam(value = "imgFile") MultipartFile imageFile
	) throws Exception{
		User user = (User) RequestHolder.getSession().getAttribute("manage_session_user_info");
		String realPath = request.getSession().getServletContext().getRealPath("/");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		String resourcePath = "attached/headPortrait/"+ymd+"/";//路径
		if(imageFile!=null){
			if(allowUpload(imageFile.getContentType())){
				String fileName = rename(imageFile.getOriginalFilename());
				int end = fileName.lastIndexOf(".");
				String saveName = fileName.substring(0,end);
				File dir = new File(realPath + resourcePath);
				if(!dir.exists()){
					dir.mkdirs();
				}
				InputStream is = imageFile.getInputStream();
				String srcImagePath = realPath + resourcePath + saveName;
				String savePath = resourcePath + saveName;
				int imageX = Integer.parseInt(x);
				int imageY = Integer.parseInt(y);
				int imageH = Integer.parseInt(h);
				int imageW = Integer.parseInt(w);
				//这里开始截取操作
				imgCut(is,srcImagePath,savePath,imageX,imageY,imageW,imageH);
			}
		}
		return "redirect:toEdit?id="+user.getId();
	}
	/**
	 * 截取图片
	 * @param is
	 * @param srcImageFile
	 * @param x
	 * @param y
	 * @param desWidth
	 * @param desHeight
	 */
	private void imgCut(InputStream is,String srcImageFile,String savePath, int x, int y, int desWidth,
							  int desHeight) {
		try {
			HttpSession session = RequestHolder.getSession();
			double ratio = 0.0;
			Double r = 100.0;
			Image img;
			ImageFilter cropFilter;
			BufferedImage bi = ImageIO.read(is);    //接收图片流
			int srcWidth = bi.getWidth();
			int srcHeight = bi.getHeight();
			double d = (double) srcWidth/600;
			x = (int)(x*d);
			y = (int)(y*d);
			desWidth = (int)(desWidth*d);
			desHeight = (int)(desHeight*d);
			if (srcWidth >= desWidth && srcHeight >= desHeight) {
				ratio = (double)(r / desWidth);
				Image image = bi.getScaledInstance(srcWidth, srcHeight,Image.SCALE_DEFAULT);
				cropFilter = new CropImageFilter(x, y, desWidth, desHeight);
				img = Toolkit.getDefaultToolkit().createImage(
						new FilteredImageSource(image.getSource(), cropFilter));
				BufferedImage tag = new BufferedImage(desWidth, desHeight,
						BufferedImage.TYPE_INT_RGB);
				int newWidth =(int)(tag.getWidth()*ratio);
				int newHeight =(int)(tag.getHeight()*ratio);
				BufferedImage bfImage= new BufferedImage(newWidth,newHeight,BufferedImage.TYPE_INT_RGB);
				bfImage.getGraphics().drawImage(img.getScaledInstance(newWidth, newHeight,Image.SCALE_SMOOTH),0,0,null);
				Graphics g = tag.getGraphics();
				g.drawImage(img, 0, 0, null);
				g.dispose();
				//输出文件
				ImageIO.write(bfImage, "JPEG", new File(srcImageFile+".jpg"));
				User user = (User) RequestHolder.getSession().getAttribute("manage_session_user_info");
				User u = new User();
				u.setId(user.getId());
				u.setPortrait(savePath+".jpg");
				userServiceImpl.update(u);
				u = userServiceImpl.selectById(u.getId());
				session.setAttribute("manage_session_user_info", u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//允许的格式
	public static final List<String> ALLOW_TYPES = Arrays.asList(
			"image/jpg","image/jpeg","image/png","image/gif"
	);
	//文件重命名
	public static String rename(String fileName){
		int i = fileName.lastIndexOf(".");
		String str = fileName.substring(i);
		return new Date().getTime()+""+ new Random().nextInt(99999999) +str;
	}
	//校验文件类型是否是被允许的
	public static boolean allowUpload(String postfix){
		return ALLOW_TYPES.contains(postfix);
	}


	@RequestMapping("unique")
	@ResponseBody
	public String unique(@ModelAttribute("e") User e,HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("utf-8");//设置响应编码为utf-8
		if(StringUtils.isNotBlank(e.getUsername())){
			User user = new User();
			user.setUsername(e.getUsername());
			user = userServiceImpl.selectOne(user);

			if(user==null){
				return "{\"ok\":\"帐号可以使用!\"}";
			}else{
				return "{\"error\":\"帐号已经存在!\"}";
			}
		}else if(StringUtils.isNotBlank(e.getNickname())){
			User user = new User();
			user.setNickname(e.getNickname());
			user = userServiceImpl.selectOne(user);
			if(user==null){
				return "{\"ok\":\"管理员名称可以使用!\"}";
			}else{
				if(e.getId()!=0 && e.getId()==user.getId()){
					return "{}";
				}else {
					return "{\"error\":\"管理员名称已经存在!\"}";
				}
			}
		}
		return null;

	}

}
