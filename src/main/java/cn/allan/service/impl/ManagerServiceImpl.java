package cn.allan.service.impl;

import cn.allan.mapper.ManagerMapper;
import cn.allan.pojo.Comment;
import cn.allan.pojo.Manager;
import cn.allan.pojo.User;
import cn.allan.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerMapper managerMapper;
    @Override
    public Manager selectManager(Manager manager) {
        return managerMapper.selectManager(manager);
    }

    @Override
    public Manager selectByUsername(String username) {
        return managerMapper.selectByUsername(username);
    }

    @Override
    public int updateManagerInfo(Manager manager) {
        return managerMapper.updateManagerInfo(manager);
    }

    @Override
    public int updatePassword(Manager manager) {
        return managerMapper.updatePassword(manager);
    }

    @Override
    public List<User> selectAllUser() {
        return managerMapper.selectAllUser();
    }

    @Override
    public int deleteUser(Integer id) {
        return managerMapper.deleteUser(id);
    }

    @Override
    public List<Comment> selectAllComment() {
        return managerMapper.selectAllComment();
    }

    @Override
    public int deleteComment(Integer id) {
        return managerMapper.deleteComment(id);
    }

    @Override
    public int countNews() {
        return managerMapper.countNews();
    }

    @Override
    public int countType() {
        return managerMapper.countType();
    }

    @Override
    public int countUser() {
        return managerMapper.countUser();
    }

    @Override
    public int countComment() {
        return managerMapper.countComment();
    }
}
