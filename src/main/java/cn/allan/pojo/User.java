package cn.allan.pojo;

import java.util.Date;

public class User {
    private Integer id;

    private String username;

    private String password;

    private Date createTime;

    private Date lastLoginTime;

    private String name;

    private String nickname;

    private String tel;

    private String gender;

    private String email;

    private String birthday;

    private String headPortrait;

    public User(Integer id, String username, String password, Date createTime, Date lastLoginTime, String name, String nickname, String tel, String gender, String email, String birthday, String headPortrait) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.createTime = createTime;
        this.lastLoginTime = lastLoginTime;
        this.name = name;
        this.nickname = nickname;
        this.tel = tel;
        this.gender = gender;
        this.email = email;
        this.birthday = birthday;
        this.headPortrait = headPortrait;
    }

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getHeadPortrait() {
        return headPortrait;
    }

    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait == null ? null : headPortrait.trim();
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", createTime=" + createTime +
                ", lastLoginTime=" + lastLoginTime +
                ", name='" + name + '\'' +
                ", nickname='" + nickname + '\'' +
                ", tel='" + tel + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", birthday=" + birthday +
                ", headPortrait='" + headPortrait + '\'' +
                '}';
    }
}