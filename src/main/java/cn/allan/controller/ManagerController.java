package cn.allan.controller;

import cn.allan.pojo.Comment;
import cn.allan.pojo.Manager;
import cn.allan.pojo.News;
import cn.allan.pojo.User;
import cn.allan.service.ManagerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/manage")
public class ManagerController {
    final static Integer pageSize = 5;

    @Autowired
    private ManagerService managerService;

    /**
     * 首页：接收session中存入的manager的username：后台
     * @param username
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String toManageIndex(String username,Model model){
        Manager manager = managerService.selectByUsername(username);
        model.addAttribute("mManager",manager);
        return "index";
    }

    /**
     * 登录：成功跳转到index页面：后台
     * @param manager
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/login")
    public String login(Manager manager, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Manager manager1 = managerService.selectManager(manager);
        if (manager1!=null){
            model.addAttribute("mManager",manager1);
            session.setAttribute("manager",manager1);
            return "index";
        }else{
            model.addAttribute("msg","用户名或密码错误");
            return "managerLogin";
        }
    }
    /**
     * 修改管理员信息：后台
     * @return
     */
    @RequestMapping("/changManagerInfo")
    public String changManagerInfo(Manager manager,Model model){
        int result = managerService.updateManagerInfo(manager);
        Manager manager1 = managerService.selectByUsername(manager.getUsername());
        model.addAttribute("mManager",manager1);
        if(result==1){
            model.addAttribute("msg","修改成功");
        }else{
            model.addAttribute("msg","修改失败");
        }
        return "index";
    }
    /**
     * 用户管理:查询所有用户：后台
     * @return
     */
    @RequestMapping("/toUserManage")
    public String toUserManage(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        PageHelper.startPage(pageNo, pageSize);
        List<User> list = managerService.selectAllUser();
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        map.addAttribute("pageInfo", pageInfo);
        return "/manage/userManage";
    }
    /**
     * 用户管理：删除用户：后台
     */
    @RequestMapping("/delete")
    public String delete(Integer id){
        System.out.println(id);
        managerService.deleteUser(id);
        return "redirect:/manage/toUserManage";
    }
    /**
     * 跳转到security页面：后台
     */
    @RequestMapping("/security")
    public String security(){
        return "/manage/security";
    }
    /**
     * 根据管理员用户名查询登录密码：后台
     */
    @RequestMapping("/checkPassword")
    @ResponseBody
    public String checkPassword(String username){
        Manager manager = managerService.selectByUsername(username);
        return manager.getPassword();
    }
    /**
     * 修改密码：：后台
     */
    @RequestMapping("/changPassword")
    public String changPassword(Manager manager,Model model){
        int result = managerService.updatePassword(manager);
        if(result==1){
            model.addAttribute("msg","密码修改成功");
        }else{
            model.addAttribute("msg","密码修改失败");
        }
        return "/manage/security";
    }
    /**
     * 退出登录：后台
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("manager");
        return "redirect:/";
    }
    /**
     * 评论管理:查询所有：后台
     */
    @RequestMapping("/commentManage")
    public String commentManage(ModelMap map, @RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        PageHelper.startPage(pageNo, pageSize);
        List<Comment> list = managerService.selectAllComment();
        PageInfo<Comment> pageInfo = new PageInfo<Comment>(list);
        map.addAttribute("pageInfo", pageInfo);
        return "/manage/commentManage";
    }
    /**
     * 评论管理：删除评论：后台
     */
    @RequestMapping("/deleteComment")
    public String deleteComment(Integer id){
        managerService.deleteComment(id);
        return "redirect:/manage/commentManage";
    }
}
