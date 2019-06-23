package cn.allan.service;

import cn.allan.pojo.Comment;

import java.util.List;

public interface CommentService {
    /**
     * 根据用户名查询其所有的评论
     * @param username
     * @return
     */
    List<Comment> selectUserComment(String username);
    /**
     * 用户删除评论
     * @param id
     */
    void delete(Integer id);
    /**
     * 用户平林新闻
     */
    int addComment(Comment comment);

    List<Comment> selectCommentByNid(Integer id);
}
