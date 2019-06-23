package cn.allan.service;


import cn.allan.pojo.Type;

import java.util.List;

public interface TypeService {

    /**
     * 判断类别是否存在
     * @param name
     * @return
     */
    boolean checkType(String name);

    /**
     * 增加类别
     * @param name
     * @return
     */
    Type addType(String name);

    /**
     * 查询所有类别
     * @return
     */
    List<Type> selectAll();

    /**
     * 根据id查询类别
     * @param id
     * @return
     */
    Type selectOne(Integer id);

    /**
     * 根据id删除类别
     * @param id
     */
    void deleteOne(Integer id);

    /**
     * 根据对象更新数据
     * @param type
     */
    void update(Type type);

    /**
     * 更改类型名时判断除本身外是否有同名的
     * @param type
     * @return
     */
    Integer checkTypeByName(Type type);

    /**
     * 删除多条记录(批量删除)
     * @param list
     * @return
     */
    void batchDelete(List<Integer> list);

    /**
     * 根据类别名称进行查询
     * @param typeName
     * @return
     */
    List<Type> fuzzyQueryType(String typeName);
}
