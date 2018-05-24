package com.enterprise.controller.manage;

import com.enterprise.entity.BackUp;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 数据库备份Action
 * Created by Cesiumai on 2016/6/7.
 */
@Controller
@RequestMapping("/manage/backups/")
public class BackupAction{

    /**
     * 数据备份-数据表列表
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("backupsList")
    public String backupsList(ModelMap model)throws Exception{
        List<BackUp> backupList = new ArrayList<BackUp>();
        backupList.add(new BackUp("网站管理员","t_user"));
        backupList.add(new BackUp("后台左侧导航","t_menu"));
        backupList.add(new BackUp("系统设置","t_systemsetting"));
        backupList.add(new BackUp("系统日志","t_systemlog"));
        backupList.add(new BackUp("留言信息","t_messages"));
        backupList.add(new BackUp("招聘信息","t_recruitment"));
        backupList.add(new BackUp("门户滚动图片","t_indeximg"));
        backupList.add(new BackUp("友情链接","t_friendlinks"));
        backupList.add(new BackUp("文章表", "t_article"));
        backupList.add(new BackUp("文章分类表", "t_articlecategory"));
        backupList.add(new BackUp("服务领域", "t_service"));
        backupList.add(new BackUp("联系我们", "t_contact"));
        backupList.add(new BackUp("关于我们", "t_about"));
        model.addAttribute("backupList",backupList);
        return "/manage/backups/backupsList";
    }

    /**
     * 对选择的表进行备份
     * @param request
     * @param tableNames
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("backups")
    @ResponseBody
    public String backups(HttpServletRequest request, String[] tableNames,  ModelMap model) throws Exception{
        InputStream is = getClass().getClassLoader().getResourceAsStream("conf.properties");
        Properties properties = new Properties();
        properties.load(is);
        export(request,properties,tableNames);

        return ("{}");
    }

    /**
     * 对选择文件进行恢复
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("recover")
    @ResponseBody
    public String recover(HttpServletRequest request,  ModelMap model) throws Exception{
        String fileName =request.getParameter("fileName");
        InputStream is = getClass().getClassLoader().getResourceAsStream("conf.properties");
        Properties properties = new Properties();
        properties.load(is);
        importSql(request,properties,fileName);
        return ("{}");
    }

    /**
     * 备份文件列表
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("recoverList")
    public String recoverList(HttpServletRequest request, ModelMap model) throws Exception{
        String realPath = request.getSession().getServletContext().getRealPath("/");
        File file = new File(realPath+"\\backup\\");
        File[] fList = file.listFiles();
        List<BackUp> recoverList = new ArrayList<BackUp>();
        for(File f:fList){
            recoverList.add(new BackUp(bytes2kb(f.length()),f.getName(),dataFormat(f.lastModified())));
        }
        Collections.reverse(recoverList);//对文件list进行倒叙处理
        model.addAttribute("recoverList",recoverList);
        return "/manage/backups/recoverList";
    }

    /**
     * 删除文件
     * @param fileName
     * @param request
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("deleteRecover")
    public String deleteRecover(String fileName,HttpServletRequest request, ModelMap model) throws Exception{
        String realPath = request.getSession().getServletContext().getRealPath("/");
        File file = new File(realPath+"\\backup\\"+fileName);
        if(file.isFile() && file.exists()){
            file.delete();
        }
        return "redirect:recoverList";
    }

    /**
     * 下载文件
     * @param fileName
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("downloadSql")
    public ResponseEntity<byte[]> download(String fileName,HttpServletRequest request) throws IOException{
        String realPath = request.getSession().getServletContext().getRealPath("/");
        String path=realPath+"\\backup\\"+fileName;
        File file = new File(path);
        HttpHeaders headers = new HttpHeaders();
        String downloadFileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment",downloadFileName);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }

    /**
     * 格式化时间
     * 把文件的“最后修改时间”的时间戳字符串格式化为 yyyy-MM-dd hh:mm:ss
     * @param data
     * @return
     */
    public static String dataFormat(long data){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date(data));
        return date;
    }

    /**
     * 文件大小转换：把字节B修改为KB、MB
     * @param bytes
     * @return
     */
    public static String bytes2kb(long bytes) {
        BigDecimal filesize = new BigDecimal(bytes);
        BigDecimal megabyte = new BigDecimal(1024 * 1024);
        float returnValue = filesize.divide(megabyte, 2, BigDecimal.ROUND_UP)
                .floatValue();
        if (returnValue > 1)
            return (returnValue + "MB");
        BigDecimal kilobyte = new BigDecimal(1024);
        returnValue = filesize.divide(kilobyte, 2, BigDecimal.ROUND_UP)
                .floatValue();
        return (returnValue + "KB");
    }

    /**
     * 执行备份
     * @param request
     * @param properties
     * @param tableNames
     * @throws IOException
     */
    public static void export(HttpServletRequest request,Properties properties ,String[] tableNames) throws IOException {
        StringBuffer sb = new StringBuffer();
        for(String t :tableNames){
            sb.append(" "+t);
        }
        Runtime runtime = Runtime.getRuntime();
        String command = getExportCommand(request,properties,sb.toString());
        runtime.exec(command);
    }

    /**
     * 执行恢复 加载sql文件，
     * @param request
     * @param properties
     * @param fileName
     * @throws IOException
     */
    public static void importSql(HttpServletRequest request,Properties properties,String fileName) throws IOException {
        Runtime runtime = Runtime.getRuntime();
        String realPath = request.getSession().getServletContext().getRealPath("/");
        String importfile = realPath+"\\backup\\"+fileName;
        String cmdarray[] = getImportCommand(request,properties,importfile);
        Process process = runtime.exec(cmdarray[0]);
        OutputStream os = process.getOutputStream();
        OutputStreamWriter writer = new OutputStreamWriter(os);
        writer.write(cmdarray[1]+"\r\n"+cmdarray[2]);
        writer.flush();
        writer.close();
        os.close();
    }

    /**
     * 执行备份sql语句
     * @param request
     * @param properties
     * @param tableName
     * @return
     */
    private static String getExportCommand(HttpServletRequest request,Properties properties,String tableName) {
        String realPath = request.getSession().getServletContext().getRealPath("/");
        StringBuffer command = new StringBuffer();
        String username = properties.getProperty("jdbc.username");
        String password = properties.getProperty("jdbc.password");
        String exportDatabaseName = properties.getProperty("jdbc.databaseName");
        String host = properties.getProperty("jdbc.host");
        String port = properties.getProperty("jdbc.port");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String ymd = sdf.format(new Date());
        String exportPath = realPath+"\\backup\\" + ymd + ".sql";
        command.append("mysqldump -u").append(username).append(" -p").append(password).append(" -h").append(host).append(" -P").append(port).append(" ").append(exportDatabaseName).append(tableName).append(" -r ").append(exportPath);
        return command.toString();
    }

    /**
     * 执行恢复sql语句
     * @param request
     * @param properties
     * @param importfile
     * @return
     */
    private static String[] getImportCommand(HttpServletRequest request,Properties properties,String importfile){
        String username = properties.getProperty("jdbc.username");
        String password = properties.getProperty("jdbc.password");
        String importDatabaseName  = properties.getProperty("jdbc.databaseName");
        String host = properties.getProperty("jdbc.host");
        String port = properties.getProperty("jdbc.port");
        String importPath  = importfile;
        String loginCommand = new StringBuffer().append("mysql -u").append(username).append(" -p").append(password).append(" -h").append(host).append(" -P").append(port).toString();
        String switchCommand = new StringBuffer("use ").append(importDatabaseName).toString();
        String importCommand = new StringBuffer("source ").append(importPath).toString();
        String[] commands = new String[] {loginCommand,switchCommand,importCommand};
        return commands;
    }

}
