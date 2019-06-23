package cn.allan.service.impl;

import cn.allan.mapper.UserMapper;
import cn.allan.pojo.User;
import cn.allan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 登录
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        return userMapper.selectByUserNameAndPwd(user);
    }

    /**
     * 注册
     * @param user
     * @return
     */
    @Override
    public int register(User user) {
        return userMapper.addUser(user);
    }

    /**
     * 根据用户名查询所有信息
     * @param username
     * @return
     */
    @Override
    public User selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    /**
     * 更新或设置用户详细信息
     * @param user
     * @return
     */
    @Override
    public int update(User user) {
        return userMapper.updateUserInfo(user);
    }

    @Override
    public String checkPassword(String username) {
        return userMapper.selectPassword(username);
    }

    @Override
    public int uploadLoginTime(User user) {
        return userMapper.uploadLoginTime(user);
    }
}
