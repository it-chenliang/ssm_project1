package cn.allan.controller;

import cn.allan.mapper.TypeMapper;
import cn.allan.pojo.Type;
import cn.allan.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;
    /**
     * 跳转到addType.jsp页面
     * @return
     */
    @RequestMapping("/addType")
    public String addType(){
        return "/type/addType";
    }
    /**
     * 增加类别名称:：后台
     * @param model
     * @param type
     * @return
     */
    @RequestMapping(value = "/add",produces={"text/html;charset=UTF-8;","application/json;"})
    public String add(Model model,Type type){
        System.out.println(type.getName());
        if (type.getName() == null || type.getName().length()<=0||type.getName().equals("")==true){
            model.addAttribute("msg","类别名称不能为空");
        }else if (!typeService.checkType(type.getName())){
            typeService.addType(type.getName());
            model.addAttribute("msg","添加成功");
        }else{
            model.addAttribute("msg","该类别名已存在");
        }
        return "/type/addType";
    }
    /**
     * 查询所有的类别：后台
     * @param model
     * @return
     */
    @RequestMapping("/all")
    public String all(Model model){
        List<Type> list = typeService.selectAll();
        model.addAttribute("typeList",list);
        return "/type/index";
    }
    /**
     * 数据回显：后台
     * @param id
     * @return
     */
    @RequestMapping("/modify")
    public String update(Model model,@RequestParam("id") Integer id){
        Type type = typeService.selectOne(id);
        model.addAttribute("type",type);
        return "/type/modify";
    }
    /**
     * 删除类别：后台
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id){
        typeService.deleteOne(id);
        return "redirect:/type/all";
    }
    /**
     * 更新类别：后台
     * @param type
     * @param model
     * @return
     */
    @RequestMapping("/update")
    public String update(Type type,Model model){
        System.out.println(type.getName());
        if (typeService.checkTypeByName(type)<1){
            typeService.update(type);
            return "redirect:/type/all";
        }else{
            model.addAttribute("msg","该类别名已存在");
            return "/type/modify";
        }
    }
    /**
     * 批量删除：后台
     * @return
     */
    @RequestMapping(value = "/batchDelete",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String batchDelete(String name){
        List<Integer> list = new ArrayList<>();
        for(int i=0;i<name.split(",").length;i++){
            list.add(Integer.parseInt(name.split(",")[i]));
        }
        typeService.batchDelete(list);
        return "success";
    }
    /**
     * 根据类别名称模糊查询：后台
     * @param model
     * @param typeName
     * @return
     */
    @RequestMapping("/fuzzyQuery")
    @ResponseBody
    public List<Type> fuzzyQuery(Model model,String typeName){
        List<Type> list = typeService.fuzzyQueryType(typeName);
        System.out.println(list.size());
        return list;
    }
}
