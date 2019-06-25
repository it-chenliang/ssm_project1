package cn.allan.service;

import cn.allan.pojo.Comment;
import cn.allan.pojo.Manager;
import cn.allan.pojo.User;

import java.util.List;

public interface ManagerService {

    Manager selectManager(Manager manager);

    Manager selectByUsername(String username);

    int updateManagerInfo(Manager manager);

    int updatePassword(Manager manager);

    List<User> selectAllUser();

    int deleteUser(Integer id);

    List<Comment> selectAllComment();

    int deleteComment(Integer id);

    int countNews();

    int countType();

    int countUser();

    int countComment();
}
