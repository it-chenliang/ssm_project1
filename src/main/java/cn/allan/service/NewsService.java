package cn.allan.service;

import cn.allan.pojo.News;
import org.w3c.dom.ls.LSInput;

import java.util.List;

public interface NewsService {
    void add(News news);

    List<News> select();

    News selectOne(Integer id);

    void update(News news);

    void delete(Integer id);
    /**
     * 删除多条记录(批量删除)s
     * @param list
     * @return
     */
    void batchDelete(List<Integer> list);
    /**
     * 模糊查询
     */
    List<News> fuzzyQuery(String text);

    /**
     * 前台数据展示
     */
    List<News> item1(String typeName);
    /**
     * 最新新闻查询(前台)
     */
    News lastNews();
    /**
     * 最新新闻(前台)
     */
    List<News> recent();
    /**
     * 国际新闻（前台）
     */
    List<News> international(String typeName);
    /**
     * 增加点击量(前台)
     */
    void updateClick(Integer id);
    /**
     * 点击排行榜(前台)
     */
    List<News> clickRank();

    /**
     * 点击次数计数
     * @param id
     * @param count
     */
    void click(Integer id,Integer count);

    /**
     * 轮播图(前台)
     * @return
     */
    List<News> carousel();

    List<News> selectByTypeId(Integer typeId);
}
