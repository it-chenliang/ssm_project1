package cn.allan.mapper;

import cn.allan.pojo.Comment;
import cn.allan.pojo.Manager;
import cn.allan.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManagerMapper {

    /**
     * 根据用户名和密码查询记录:登录
     * @return
     */
    Manager selectManager(Manager manager);
    /**
     * 根据用户名查询信息
     */
    Manager selectByUsername(@Param("username") String username);

    /**
     * 修改管理员信息
     * @param manager
     * @return
     */
    int updateManagerInfo(Manager manager);
    /**
     * 根据用户名修改密码
     * @param manager
     * @return
     */
    int updatePassword(Manager manager);
    /**
     * 用户管理:查询所有的用户
     */
    List<User> selectAllUser();
    /**
     * 用户管理：删除用户
     * @param id
     * @return
     */
    int deleteUser(@Param("id") Integer id);
    /**
     * 评论管理：查询所有的新闻评论
     * @return
     */
    List<Comment> selectAllComment();
    /**
     * 评论管理：删除评论
     */
    int deleteComment(@Param("id")Integer id);
}