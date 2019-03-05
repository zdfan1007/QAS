package com.cn.bysj.dao;

import com.cn.bysj.pojo.Person;



public interface IPersonDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Person record);

    int insertSelective(Person record);

    Person selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);
    
    //added later
    Person selectByUsername(String username);
    Person selectByMail(String mail);
    Person selectByEMail(Person record);
    Person selectByCodeAndEmail(Person record);
    int updateStateByCode(Person record);
    Person selectByPwdAndEmail(Person record);
    
}