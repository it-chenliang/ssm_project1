package cn.allan.controller;

import cn.allan.pojo.Comment;
import cn.allan.pojo.News;
import cn.allan.pojo.Type;
import cn.allan.pojo.User;
import cn.allan.service.CommentService;
import cn.allan.service.NewsService;
import cn.allan.service.TypeService;
import cn.allan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private NewsService newsService;
    @Autowired
    private TypeService typeService;
    /**
     * 查询当前用户的所有评论:前台
     * @param username
     * @return
     */
    @RequestMapping("/userComment")
    @ResponseBody
    public List<Comment> userComment(String username){
        List<Comment> list = commentService.selectUserComment(username);
        return list;
    }
    /**
     * 用户删除某条评论记录:前台
     * @param username
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/delete")
    public String delete(String username, Integer id, Model model){
        commentService.delete(id);
        User user = userService.selectByUsername(username);
        model.addAttribute("user",user);
        return "/user/userInfo";
    }
    /**
     * 当前用户发布评论:前台
     * 并且再根据新闻id查询所有评论返回到页面上
     * @param comment
     * @param model
     * @return
     */
    @RequestMapping("/addComment")
    public String addComment(Comment comment,Model model){
        comment.setComdate(new Date());
        commentService.addComment(comment);
        //查询为id的详细信息
        News news = newsService.selectOne(comment.getNewsId());
        model.addAttribute("news",news);
        //查询所有的type
        List<Type> list = typeService.selectAll();
        model.addAttribute("list",list);
        return "/news/detail";
    }
    /**
     * 根据新闻id查询新闻对应的评论:前台
     * @param id
     * @return
     */
    @RequestMapping("/selectCommentByNid")
    @ResponseBody
    public List<Comment> selectCommentByNid(Integer id){
        List<Comment> list = commentService.selectCommentByNid(id);
        return list;
    }
}
