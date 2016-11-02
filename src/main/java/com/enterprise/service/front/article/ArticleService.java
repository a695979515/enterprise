package com.enterprise.service.front.article;

import com.enterprise.core.Services;
import com.enterprise.service.front.article.bean.Article;

/**
 * Created by Cesiumai on 2016/6/14.
 */
public interface ArticleService extends Services<Article>{
    Article selectPrevious(int id);
    Article selectNext(int id);
}
