package cn.allan.mapper;


import cn.allan.pojo.News;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface NewsMapper {
    void add(News news);

    /**
     * 查询所有的新闻
     * @return
     */
    List<News> select();

    /**
     * 查询单个新闻详情
     * @param id
     * @return
     */
    News selectOne(@Param("id")Integer id);
    /**
     * 更新新闻
     */
    void update(News news);
    /**
     * 删除新闻
     */
    void delete(@RequestParam("id")Integer id);
    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<Integer> list);

    List<News> fuzzyQuery(@Param("text")String text);

    /**
     * 前台数据展示
     */
    List<News> item1(@Param("typeName") String typeName);
    /**
     * 最新新闻查询(前台)
     */
    News lastNews();
    /**
     * 最近新闻(前台)
     */
    List<News> recent();
    /**
     * 查询国际类别新闻(前台)
     */
    List<News> international(@Param("typeName") String typeName);
    /**
     * 增加点击量(前台)
     */
    void updateClick(@Param("id") Integer id);
    /**
     * 点击排行(前台)
     */
    List<News> clickRank();

    void click(@Param("id") Integer id,@Param("count")Integer count);

    /**
     * 轮播图栏目(前台)
     */
    List<News> carousel();
    /**
     * 类别分类
     */
    List<News> selectByTypeId(@Param("typeId")Integer typeId);
}
