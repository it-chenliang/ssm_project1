package cn.allan.controller;

import cn.allan.pojo.News;
import cn.allan.pojo.Type;
import cn.allan.service.NewsService;
import cn.allan.service.TypeService;
import cn.allan.service.UploadService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {
    final static Integer pageSize = 5;

    @Autowired
    private TypeService typeService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private UploadService uploadService;

    /**
     * 获取所有的类别
     * @param
     * @return
     */
    @RequestMapping("/type")
    @ResponseBody
    public List<Type> type(){
        List<Type> list = typeService.selectAll();
        return list;
    }

    /**
     * 跳转到add.jsp
     * @return
     */
    @RequestMapping("/addNews")
    public String addNews(){
        return "/news/add";
    }

    @RequestMapping(value = "/add",produces={"text/html;charset=UTF-8;","application/json;"})
    public String add(@RequestParam("file") MultipartFile file,Model model,HttpServletRequest request,News news){
        //上传文件保存并返回新文件名
        String newFilename = uploadService.upload(file,request);
        //设置时间
        Date date = new Date();
        news.setPubdate(date);
        news.setClick(0);
        //设置新闻的图片路径
        news.setPicturePath(newFilename);
        //添加到数据库
        newsService.add(news);
        model.addAttribute("msg",news.getName() + "-->添加成功");
        return "/news/add";
    }

    @RequestMapping(value = "/all",produces={"text/html;charset=UTF-8;","application/json;"})
    public String test(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo){
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<News> newsList = newsService.select();
        PageInfo<News> pageInfo = new PageInfo<News>(newsList);
        map.addAttribute("pageInfo", pageInfo);
        return "/news/index";
    }

    /**
     * 查询新闻详情：后台
     * @param id
     * @return
     */
    @RequestMapping(value = "/selectOne")
    @ResponseBody
    public News selectOne(@RequestParam("id")Integer id){
        News news = newsService.selectOne(id);
        return news;
    }

    /**
     * 修改新闻数据回显：后台
     * @param id
     * @return
     */
    @RequestMapping("/modify")
    public String modify(@RequestParam("id")Integer id,Model model){
        System.out.println("正在进行新闻修改............");
        News news = newsService.selectOne(id);
        model.addAttribute("news",news);
        return "/news/modify";
    }
    /**
     * 修改新闻：后台
     * @param news
     * @return
     */
    @RequestMapping("/update")
    public String update(@RequestParam("file") MultipartFile file,HttpServletRequest request,News news){
        String newFilename;
        //判断图片是否更改
        if(!(file.getOriginalFilename()=="")){
            newFilename = uploadService.upload(file,request);
            news.setPicturePath(newFilename);
        }
        Date date = new Date();
        news.setPubdate(date);
        newsService.update(news);
        return "redirect:/news/all";
    }

    /**
     * 删除新闻：后台
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam("id")Integer id){
        newsService.delete(id);
        return "redirect:/news/all";
    }
    /**
     * 批量删除新新闻：后台
     */
    @RequestMapping("/batchDelete")
    @ResponseBody
    public String batchDelete(String ids){
        List<Integer> list = new ArrayList<>();
        String[] arr = ids.split(",");
        for(int i=0;i<arr.length;i++){
            list.add(Integer.parseInt(arr[i]));
        }
        newsService.batchDelete(list);
        return "success";
    }

    /**
     * 模糊查询(后台)
     * @param text
     * @param map
     * @param pageNo
     * @param model
     * @return
     */
    @RequestMapping("/fuzzyQuery")
    public String fuzzyQuery(String text,ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Model model){
        System.out.println("正在进行模糊查询");
        PageHelper.startPage(pageNo, pageSize);
        List<News> newsList = newsService.fuzzyQuery(text);
        PageInfo<News> pageInfo = new PageInfo<News>(newsList);
        map.addAttribute("pageInfo", pageInfo);
        model.addAttribute("info",text);
        return "/news/query";
    }
    /**
     *  军事新闻查询：前台
     */
    @RequestMapping("/item1")
    @ResponseBody
    public List<News> item1(){
        List<News> list = newsService.item1("军事");
        return list;
    }

    /**
     * 最新新闻查询：前台
     * @return
     */
    @RequestMapping("/lastNews")
    @ResponseBody
    public News lastNews(){
        System.out.println("正在进行最新新闻查询..........");
        News news = newsService.lastNews();
        return news;
    }
    /**
     * 按照时间排序查询前8条新闻：前台
     * @return
     */
    @RequestMapping("/recentNews")
    @ResponseBody
    public List<News> recentNews(){
        List<News> list = newsService.recent();
        return list;
    }
    /**
     * 国际新闻查询：根据点击量排序取前三：前台
     * @return
     */
    @RequestMapping("/international")
    @ResponseBody
    public List<News> international(){
        List<News> list = newsService.international("国际");
        return list;
    }

    /**
     * 点击排行榜:根据点击量排序取前8：前台
     * @return
     */
    @RequestMapping("/clickRank")
    @ResponseBody
    public List<News> rank(){
        List<News> list = newsService.clickRank();
        return list;
    }

    /**
     * 查看新闻详情：根据id查看：前台
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("detail")
    public String detail(@RequestParam("id")Integer id,Model model){
        //查询为id的详细信息
        News news = newsService.selectOne(id);
        model.addAttribute("news",news);
        //查询所有的type
        List<Type> list = typeService.selectAll();
        model.addAttribute("list",list);
        return "/news/detail";
    }

    /**
     * 测试点击量添加:前台
     * @param model
     * @return
     */
    @RequestMapping("/viewCount")
    public String test(Model model){
        //查询为id的详细信息
        News news = newsService.selectOne(5);
        model.addAttribute("news",news);
        return "/news/test";
    }
    /**
     * 更新点击量：前台
     * @param request
     * @return
     */
    @RequestMapping(value = "/view",method = {RequestMethod.POST})
    @ResponseBody
    public Integer view(HttpServletRequest request){
        System.out.println("正在更新点击量...........");
        Integer id = Integer.valueOf(request.getParameter("id"));
        News news = newsService.selectOne(id);
        newsService.click(id,news.getClick() + 1);
        return news.getClick() + 1;
    }

    /**
     * 轮播图栏目查询:前台
     * @return
     */
    @RequestMapping("/carousel")
    @ResponseBody
    public List<News> carousel(){
        List<News> list = newsService.carousel();
        return list;
    }
    /**
     * 类别分类查询：前台
     * @return
     */
    @RequestMapping("/typeInfo")
    public String typeInfo(ModelMap map,@RequestParam(defaultValue="1",required=true,value="pageNo") Integer pageNo,Integer typeId){
        //分页查询
        PageHelper.startPage(pageNo, pageSize);
        List<News> list = newsService.selectByTypeId(typeId);
        PageInfo<News> pageInfo = new PageInfo<News>(list);
        map.addAttribute("pageInfo", pageInfo);
        return "/news/typeInfo";
    }
}
