package cn.allan.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * 文件上传
 */
public interface UploadService {
    String upload(MultipartFile file, HttpServletRequest request);
}
