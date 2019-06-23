package cn.allan.service.impl;

import cn.allan.mapper.CommentMapper;
import cn.allan.pojo.Comment;
import cn.allan.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    /**
     * 根据用户名查询其所有的评论
     * @param username
     * @return
     */
    @Override
    public List<Comment> selectUserComment(String username) {
        return commentMapper.selectUserComment(username);
    }

    @Override
    public void delete(Integer id) {
        commentMapper.delete(id);
    }

    @Override
    public int addComment(Comment comment) {
        return commentMapper.insert(comment);
    }

    @Override
    public List<Comment> selectCommentByNid(Integer id) {
        return commentMapper.selectCommentByNid(id);
    }
}
