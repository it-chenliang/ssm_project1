package cn.allan.service.impl;

import cn.allan.mapper.TypeMapper;
import cn.allan.pojo.Type;
import cn.allan.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public boolean checkType(String name) {
        return typeMapper.checkType(name);
    }

    @Override
    public Type addType(String name) {
        return typeMapper.addType(name);
    }

    @Override
    public List<Type> selectAll() {
        return typeMapper.selectAll();
    }

    @Override
    public Type selectOne(Integer id) {
        return typeMapper.selectOne(id);
    }

    @Override
    public void deleteOne(Integer id) {
        typeMapper.deleteOne(id);
    }

    @Override
    public void update(Type type) {
        typeMapper.update(type);
    }

    @Override
    public Integer checkTypeByName(Type type) {
        return typeMapper.checkTypeByName(type);
    }

    @Override
    public void batchDelete(List<Integer> list) {
        typeMapper.batchDelete(list);
    }

    @Override
    public List<Type> fuzzyQueryType(String typeName) {
        return typeMapper.fuzzyQueryType(typeName);
    }

}
