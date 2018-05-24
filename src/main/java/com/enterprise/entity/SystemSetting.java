package com.enterprise.entity;

import java.io.Serializable;

import com.enterprise.entity.page.PageModel;

/**
 * 系统设置 实体类
 */
public class SystemSetting extends PageModel implements Serializable {

    private int id;
    private String name;        //系统名称
    private String www;            //门户地址
    private String logo;        //门户logo
    private String title;        //网站标题
    private String description;    //seo描述
    private String keywords;    //seo关键字
    private String favicon;        //网页title图标
    private String address;        //公司地址
    private String tel;            //公司电话
    private String email;        //公司邮箱
    private String icp;            //网站备案号
    private String isopen;        //是否开放网站
    private String closeMsg;    //关闭网站时显示的信息
    private String qq;            //公司QQ
    private String qqService;    //QQ客服
    private String statisticsCode;//站长统计代码
    private String version;        //系统版本
    private String imageRootPath;//图片根目录
    private String fax;            //传真
    private String phone;        //手机
    private String serverInfo;    //服务器吗名称
    private String serverVersion;//服务器版本
    private String javaVersion;        //java版本
    private String javaHome;        //java路径
    private String osName;        //操作系统名称
    private String osVersion;        //操作系统版本
    private String mysqlVersion;    //mysql版本

    @Override
    public void clean() {
        super.clean();
        id = 0;
        name = null;
        www = null;
        logo = null;
        title = null;
        description = null;
        keywords = null;
        favicon = null;
        address = null;
        tel = null;
        email = null;
        icp = null;
        isopen = null;
        closeMsg = null;
        qq = null;
        qqService = null;
        statisticsCode = null;
        version = null;
        imageRootPath = null;
        fax = null;
        phone = null;
        serverInfo = null;
        serverVersion = null;
        javaVersion = null;
        javaHome = null;
        osName = null;
        osVersion = null;
        mysqlVersion = null;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getWww() {
        return www;
    }


    public void setWww(String www) {
        this.www = www;
    }


    public String getLogo() {
        return logo;
    }


    public void setLogo(String logo) {
        this.logo = logo;
    }


    public String getTitle() {
        return title;
    }


    public void setTitle(String title) {
        this.title = title;
    }


    public String getDescription() {
        return description;
    }


    public void setDescription(String description) {
        this.description = description;
    }


    public String getKeywords() {
        return keywords;
    }


    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }


    public String getFavicon() {
        return favicon;
    }


    public void setFavicon(String favicon) {
        this.favicon = favicon;
    }


    public String getAddress() {
        return address;
    }


    public void setAddress(String address) {
        this.address = address;
    }


    public String getTel() {
        return tel;
    }


    public void setTel(String tel) {
        this.tel = tel;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public String getIcp() {
        return icp;
    }


    public void setIcp(String icp) {
        this.icp = icp;
    }


    public String getIsopen() {
        return isopen;
    }


    public void setIsopen(String isopen) {
        this.isopen = isopen;
    }


    public String getCloseMsg() {
        return closeMsg;
    }


    public void setCloseMsg(String closeMsg) {
        this.closeMsg = closeMsg;
    }


    public String getQq() {
        return qq;
    }


    public void setQq(String qq) {
        this.qq = qq;
    }


    public String getQqService() {
        return qqService;
    }


    public void setQqService(String qqService) {
        this.qqService = qqService;
    }


    public String getStatisticsCode() {
        return statisticsCode;
    }


    public void setStatisticsCode(String statisticsCode) {
        this.statisticsCode = statisticsCode;
    }


    public String getVersion() {
        return version;
    }


    public void setVersion(String version) {
        this.version = version;
    }


    public String getImageRootPath() {
        return imageRootPath;
    }


    public void setImageRootPath(String imageRootPath) {
        this.imageRootPath = imageRootPath;
    }


    public String getFax() {
        return fax;
    }


    public void setFax(String fax) {
        this.fax = fax;
    }


    public String getPhone() {
        return phone;
    }


    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getServerInfo() {
        return serverInfo;
    }

    public void setServerInfo(String serverInfo) {
        this.serverInfo = serverInfo;
    }

    public String getServerVersion() {
        return serverVersion;
    }

    public void setServerVersion(String serverVersion) {
        this.serverVersion = serverVersion;
    }

    public String getJavaVersion() {
        return javaVersion;
    }

    public void setJavaVersion(String javaVersion) {
        this.javaVersion = javaVersion;
    }

    public String getOsName() {
        return osName;
    }

    public void setOsName(String osName) {
        this.osName = osName;
    }

    public String getJavaHome() {
        return javaHome;
    }

    public void setJavaHome(String javaHome) {
        this.javaHome = javaHome;
    }

    public String getOsVersion() {
        return osVersion;
    }

    public void setOsVersion(String osVersion) {
        this.osVersion = osVersion;
    }

    public String getMysqlVersion() {
        return mysqlVersion;
    }

    public void setMysqlVersion(String mysqlVersion) {
        this.mysqlVersion = mysqlVersion;
    }
}
