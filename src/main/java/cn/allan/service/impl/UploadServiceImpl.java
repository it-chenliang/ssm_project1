package cn.allan.service.impl;

import cn.allan.service.UploadService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Service
public class UploadServiceImpl implements UploadService {
    /**
     * 文件上传
     */
    @Override
    public String upload(MultipartFile file, HttpServletRequest request) {
        //1、上传后的地址
        String realPath = request.getSession().getServletContext().getRealPath("/uploads");
        //2、获取文件名
        String filename = file.getOriginalFilename();
        //3、获取文件前缀、后缀
        //后缀
        String fileNameSuffix = "jpg";
        //4、给上传的文件起别名
        String newFilename = (new Date()).getTime()+"."+fileNameSuffix;
        //5、创建File对象，传入目标路径参数，和新的文件别名
        File dir = new File(realPath,newFilename);
        //6、如果dir代表的文件不存在，则创建它
        if (!dir.exists()){
            //创建目录
            dir.mkdirs();
        }
        //7、将上传的实体文件复制到指定目录upload下
        try {
            file.transferTo(dir);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/uploads/" + newFilename;
    }
}
