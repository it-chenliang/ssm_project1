package cn.allan.pojo;

public class Manager {
    private Integer id;

    private String username;

    private String password;

    private String tel;

    private String nickname;

    private String name;

    private String email;

    public Manager(Integer id, String username, String password, String tel, String nickname, String name, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.tel = tel;
        this.nickname = nickname;
        this.name = name;
        this.email = email;
    }

    public Manager() {
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", nickname='" + nickname + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}