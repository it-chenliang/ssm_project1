package cn.allan.mapper;
import cn.allan.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeMapper {

    boolean checkType(@Param("name") String name);

    Type addType(@Param("name") String name);

    List<Type> selectAll();

    Type selectOne(@Param("id") Integer id);

    void deleteOne(@Param("id") Integer id);

    void update(Type type);

    /**
     * 更改类型名时判断除本身外是否有同名的
     * @param type
     * @return
     */
    Integer checkTypeByName(Type type);

    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<Integer> list);
    /**
     * 模糊查询
     */
    List<Type> fuzzyQueryType(@Param("typeName") String typeName);
}