package cn.allan.service.impl;

import cn.allan.mapper.NewsMapper;
import cn.allan.pojo.News;
import cn.allan.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public void add(News news) {
        newsMapper.add(news);
    }

    @Override
    public List<News> select() {
        return newsMapper.select();
    }

    @Override
    public News selectOne(Integer id) {
        return newsMapper.selectOne(id);
    }

    @Override
    public void update(News news) {
        newsMapper.update(news);
    }

    @Override
    public void delete(Integer id) {
        newsMapper.delete(id);
    }

    @Override
    public void batchDelete(List<Integer> list) {
        newsMapper.batchDelete(list);
    }

    @Override
    public List<News> fuzzyQuery(String text) {
        return newsMapper.fuzzyQuery(text);
    }

    /**
     * 前台数据展示
     * @param typeName
     * @return
     */
    @Override
    public List<News> item1(String typeName) {
        return newsMapper.item1(typeName);
    }

    /**
     * 最新新闻查询（前台）
     * @return
     */
    @Override
    public News lastNews() {
        return newsMapper.lastNews();
    }

    @Override
    public List<News> recent() {
        return newsMapper.recent();
    }

    @Override
    public List<News> international(String typeName) {
        return newsMapper.international(typeName);
    }

    @Override
    public void updateClick(Integer id) {
        newsMapper.updateClick(id);
    }

    @Override
    public List<News> clickRank() {
        return newsMapper.clickRank();
    }

    @Override
    public void click(Integer id, Integer count) {
        newsMapper.click(id,count);
    }

    @Override
    public List<News> carousel() {
        return newsMapper.carousel();
    }

    @Override
    public List<News> selectByTypeId(Integer typeId) {
        return newsMapper.selectByTypeId(typeId);
    }
}
