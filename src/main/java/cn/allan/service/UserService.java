package cn.allan.service;

import cn.allan.pojo.User;

public interface UserService {
    User login(User user);

    int register(User user);

    User selectByUsername(String username);

    int update(User user);

    String checkPassword(String username);

    int uploadLoginTime(User user);
}
