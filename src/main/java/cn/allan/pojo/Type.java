package cn.allan.pojo;

public class Type {
    private Integer id;

    private String name;

    public Type(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Type() {
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

    @Override
    public String toString() {
        return "Type{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}