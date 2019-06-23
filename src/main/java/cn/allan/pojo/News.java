package cn.allan.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class News {
    private Integer id;

    private String name;

    private String author;

    private Integer typeId;

    private Type type;

    private String content;

    private String keyword;

    private String picturePath;

    private String source;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date pubdate;

    private String publisher;

    private Integer click;

    public News(Integer click,Integer id, String name, String author, Integer typeId, String content, String keyword, String picturePath, String source, Date pubdate, String publisher) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.typeId = typeId;
        this.content = content;
        this.keyword = keyword;
        this.picturePath = picturePath;
        this.source = source;
        this.pubdate = pubdate;
        this.publisher = publisher;
        this.click = click;
    }

    public News() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath == null ? null : picturePath.trim();
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public Date getPubdate() {
        return pubdate;
    }

    public void setPubdate(Date pubdate) {
        this.pubdate = pubdate;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher == null ? null : publisher.trim();
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", typeId=" + typeId +
                ", type=" + type +
                ", content='" + content + '\'' +
                ", keyword='" + keyword + '\'' +
                ", picturePath='" + picturePath + '\'' +
                ", source='" + source + '\'' +
                ", pubdate=" + pubdate +
                ", publisher='" + publisher + '\'' +
                ", click=" + click +
                '}';
    }
}