package cn.allan.controller;

import cn.allan.mapper.UserMapper;
import cn.allan.pojo.User;
import cn.allan.service.UploadService;
import cn.allan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UploadService uploadService;
    @Autowired
    private UserMapper userMapper;

    /**
     * 注册时核对用户名是否可用：前台
     * @return
     */
    @RequestMapping("/checkUsername")
    @ResponseBody
    public boolean checkUsername(String username){
        User user = userService.selectByUsername(username);
        if(user!=null){
            return false;
        }else{
            return true;
        }
    }

    /**
     * 注册：前台
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/register")
    public String register(User user,HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        user.setCreateTime(new Date());
        user.setLastLoginTime(new Date());
        userService.register(user);
        User user1 = userService.selectByUsername(user.getUsername());
        session.setAttribute("user",user1);
        return "redirect:/";
    }

    /**
     * 登录：前台
     * @param user1
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(User user1, HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        //登录成功前将用户信息存入session，方便访问上次登录时间
        User user2 = userService.selectByUsername(user1.getUsername());
        session.setAttribute("user2", user2);
        //再执行登录
        User user = userService.login(user1);
        if (user!=null){
            //登录成功，将user对象设置到HttpSession作用范围域中，更新登录时间
            user1.setLastLoginTime(new Date());
            userService.uploadLoginTime(user1);
            session.setAttribute("user", user);
            return "redirect:/";
        }else{
            //登录失败，设置失败信息，并调转到登录页面
            model.addAttribute("message","登录名和密码错误，请重新输入");
            model.addAttribute("user",user1);
            return "login";
        }
    }
    /**
     * 跳转到用户个人中心：前台
     * @param username
     * @param model
     * @return
     */
    @RequestMapping("/userInfo")
    public String userInfo(String username,Model model){
        User user = userService.selectByUsername(username);
        model.addAttribute("user",user);
        return "/user/userInfo";
    }
    /**
     * 用户基本信息设置或者修改：前台
     * @return
     */
    @RequestMapping("/changeUserInfo")
    public String changeUserInfo(@RequestParam("file") MultipartFile file, Model model, HttpServletRequest request,User user){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        //上传文件保存并返回新文件名
        String newFilename;
        //判断图片是否更改
        if(!(file.getOriginalFilename()=="")){
            newFilename = uploadService.upload(file,request);
            user.setHeadPortrait(newFilename);
        }
        //执行修改
        userService.update(user);
        User user1 = userService.selectByUsername(user.getUsername());
        session.setAttribute("user",user1);
        model.addAttribute("user",user1);
        return "/user/userInfo";
    }
    /**
     * 用户修改密码时：验证密码是否正确：前台
     */
    @RequestMapping("/checkPassword")
    @ResponseBody
    public String checkPassword(String username){
        String password = userService.checkPassword(username);
        return password;
    }
    /**
     * 修改密码：前台
     */
    @RequestMapping("/changPassword")
    public String changPassword(User user,Model model){
        System.out.println(user);
        int result = userMapper.updateUserPassword(user);
        User user1 = userMapper.selectByUsername(user.getUsername());
        System.out.println(user1);
        model.addAttribute("user",user1);
        if(result==1){
            model.addAttribute("msg","修改密码成功");
            return "/user/security";
        }else{
            model.addAttribute("msg","修改密码失败");
            return "/user/security";
        }
    }

    /**
     * 退出登录：前台
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("user2");
        return "redirect:/";
    }
}
