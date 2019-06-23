package cn.allan.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Comment {
    private Integer id;

    private Integer userId;

    private Integer newsId;

    private String content;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date comdate;

    private User user;

    private News news;

    public Comment(Integer id, Integer userId, Integer newsId, String content, Date comdate,User user,News news) {
        this.id = id;
        this.userId = userId;
        this.newsId = newsId;
        this.content = content;
        this.comdate = comdate;
        this.user = user;
        this.news = news;
    }

    public Comment() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getComdate() {
        return comdate;
    }

    public void setComdate(Date comdate) {
        this.comdate = comdate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", newsId=" + newsId +
                ", content='" + content + '\'' +
                ", comdate=" + comdate +
                ", user=" + user +
                ", news=" + news +
                '}';
    }
}