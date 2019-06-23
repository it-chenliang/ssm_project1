package cn.allan.mapper;

import cn.allan.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    /**
     * 根据用户名查询其所有的评论
     * @param username
     * @return
     */
    List<Comment> selectUserComment(@Param("username")String username);
    /**
     * 删除评论
     */
    void delete(@Param("id") Integer id);
    /**
     * 用户评论新闻
     */
    int insert(Comment comment);

    /**
     * 根据新闻id查询新闻对应的所有评论
     * @param id
     * @return
     */
    List<Comment> selectCommentByNid(Integer id);
}