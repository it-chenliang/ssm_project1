package cn.allan.mapper;

import cn.allan.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {

    /**
     * 根据用户名和密码查询记录:登录
     * @return
     */
    User selectByUserNameAndPwd(User user);

    /**
     * 根据user添加数据：注册
     * @param user
     * @return
     */
    int addUser(User user);

    User selectByUsername(@Param("username") String username);

    /**
     * 设置或者更新用户详情信息
     * @param user
     * @return
     */
    int updateUserInfo(User user);

    /**
     * 根据用户名查询密码
     * @param username
     * @return
     */
    String selectPassword(@Param("username") String username);
    /**
     * 根据用户名修改密码
     */
    int updateUserPassword(User user);
    /**
     * 更新最后一次登录时间
     */
    int uploadLoginTime(User user);
}