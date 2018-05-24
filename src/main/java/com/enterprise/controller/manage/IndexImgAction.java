package com.enterprise.controller.manage;


import com.enterprise.cache.FrontCache;
import com.enterprise.service.Services;
import com.enterprise.entity.IndexImg;
import com.enterprise.entity.page.PageModel;
import com.enterprise.service.IndexImgService;
import com.enterprise.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**门户滚动图片Action
 * Created by Cesiumai on 2016/5/27.
 */
@Controller
@RequestMapping("/manage/indexImg/")
public class IndexImgAction extends BaseController<IndexImg>{
    private static final String page_toEdit = "/manage/indexImg/indexImgList";
    private static final String page_toList = "/manage/indexImg/indexImgList";
    private static final String page_toAdd = "/manage/indexImg/indexImgList";

    public IndexImgAction(){
        super.page_toAdd = page_toAdd;
        super.page_toEdit = page_toEdit;
        super.page_toList = page_toList;
    }
    private ServletContext servletContext;

    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
    @Autowired
    private IndexImgService indexImgService;
    @Autowired
    private FrontCache frontCache;
    @Override
    public Services<IndexImg> getService() {
        return indexImgService;
    }


    /**
     * 更新
     * @param request
     * @param e
     * @param flushAttrs
     * @return
     * @throws Exception
     */
    @Override
    public String update(HttpServletRequest request, @ModelAttribute("e") IndexImg e, RedirectAttributes flushAttrs) throws Exception {
        indexImgService.update(e);
        insertAfter(e);
        //加载门户图片缓存
        frontCache.loadIndexImg();
        addMessage(flushAttrs, "操作成功！");
        return "redirect:selectList";
    }

    /**
     * 插入
     * @param request
     * @param e
     * @param flushAttrs
     * @return
     * @throws Exception
     */
    @Override
    public String insert(HttpServletRequest request, @ModelAttribute("e") IndexImg e, RedirectAttributes flushAttrs) throws Exception {
        indexImgService.insert(e);
        insertAfter(e);
        //加载门户图片缓存
        frontCache.loadIndexImg();
        addMessage(flushAttrs,"操作成功！");
        return "redirect:selectList";
    }

    /**
     * 批量删除
     * @param request
     * @param ids
     * @param e
     * @param flushAttrs
     * @return
     * @throws Exception
     */
    @Override
    public String deletes(HttpServletRequest request, String[] ids, @ModelAttribute("e") IndexImg e, RedirectAttributes flushAttrs) throws Exception {
        indexImgService.deletes(ids);
        //加载门户图片缓存
        frontCache.loadIndexImg();
        addMessage(flushAttrs,"操作成功！");
        return "redirect:selectList";
    }
    @RequestMapping("delete")
    public String delete(HttpServletRequest request,  @ModelAttribute("e") IndexImg e, RedirectAttributes flushAttrs) throws Exception {
        indexImgService.delete(e);
        //加载门户图片缓存
        frontCache.loadIndexImg();
        addMessage(flushAttrs,"操作成功！");
        return "redirect:selectList";
    }

    @Override
    public String toEdit(@ModelAttribute("e") IndexImg e, ModelMap model) throws Exception {
        e = indexImgService.selectOne(e);
        IndexImg indexImg = new IndexImg();
        indexImg.setOffset(0);
        PageModel page = getService().selectPageList(indexImg);
        model.addAttribute("e", e);
        model.addAttribute("pager", page);
        return page_toEdit;
    }
}
