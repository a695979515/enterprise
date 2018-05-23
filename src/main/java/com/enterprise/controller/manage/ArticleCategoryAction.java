package com.enterprise.controller.manage;

import com.enterprise.cache.FrontCache;
import com.enterprise.service.Services;
import com.enterprise.entity.ArticleCategory;
import com.enterprise.service.ArticleCategoryService;
import com.enterprise.controller.BaseController;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 文章分类Action
 * Created by Cesiumai on 2016/6/14.
 */
@Controller
@RequestMapping("/manage/articleCategory/")
public class ArticleCategoryAction extends BaseController<ArticleCategory>{
    private static final String page_toList = "/manage/articleCategory/articleCategoryList";
    private static final String page_toEdit = "/manage/articleCategory/articleCategoryEdit";
    private static final String page_toAdd = "/manage/articleCategory/articleCategoryEdit";
    @Autowired
    private ArticleCategoryService articleCategoryService;
    @Autowired
    private FrontCache frontCache;
    @Override
    public Services<ArticleCategory> getService() {
        return articleCategoryService;
    }
    public ArticleCategoryAction(){
        super.page_toList = page_toList;
        super.page_toEdit = page_toEdit;
        super.page_toAdd = page_toAdd;
    }

    @Override
    public String insert(HttpServletRequest request, @ModelAttribute("e") ArticleCategory articleCategory, RedirectAttributes flushAttrs) throws Exception {
        articleCategoryService.insert(articleCategory);
        insertAfter(articleCategory);
        addMessage(flushAttrs,"操作成功！");
        frontCache.loadArticleCategroy();//加载缓存
        return "redirect:selectList";
    }

    @Override
    public String update(HttpServletRequest request, @ModelAttribute("e") ArticleCategory articleCategory, RedirectAttributes flushAttrs) throws Exception {
        articleCategoryService.update(articleCategory);
        insertAfter(articleCategory);
        addMessage(flushAttrs, "操作成功！");
        frontCache.loadArticleCategroy();//加载缓存
        return "redirect:selectList";
    }
    @RequestMapping("delete")
    public String delete(HttpServletRequest request, @ModelAttribute("e") ArticleCategory articleCategory, RedirectAttributes flushAttrs) throws Exception{
        articleCategoryService.delete(articleCategory);
        insertAfter(articleCategory);
        addMessage(flushAttrs, "操作成功！");
        frontCache.loadArticleCategroy();//加载缓存
        return "redirect:selectList";
    }
    @RequestMapping("unique")
    @ResponseBody
    public String unique(@ModelAttribute("e") ArticleCategory e,HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");//设置响应编码为utf-8
        if(StringUtils.isNotBlank(e.getCatename())){
            ArticleCategory articleCategory = new ArticleCategory();
            articleCategory.setCatename(e.getCatename());
            articleCategory = articleCategoryService.selectOne(articleCategory);

            if(articleCategory==null){
                return "{}";
            }else{
                if(e.getId()!=0 && e.getId()==articleCategory.getId()){
                    return "{}";
                }else {
                    return "{\"error\":\"分类名称已经存在!\"}";
                }
            }
        }else if(StringUtils.isNotBlank(e.getCode())){
            ArticleCategory articleCategory = new ArticleCategory();
            articleCategory.setCode(e.getCode());
            articleCategory = articleCategoryService.selectOne(articleCategory);
            if(articleCategory==null){
                return "{}";
            }else{
                if(e.getId()!=0 && e.getId()==articleCategory.getId()){
                    return "{}";
                }else {
                    return "{\"error\":\"编码已经存在!\"}";
                }
            }
        }
        return null;
    }
}
