package com.yijia.enterprise.database.mapper;

import com.yijia.enterprise.domain.entity.PUser;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface SpecPUserMapper extends Mapper<PUser> {
    @Select(
     "<script>                           "+
     "SELECT                            "+
     "userId,                          "+
     "phone,                          "+
     "name,                            "+
     "age,                             "+
     "sex,                             "+
     "birthday,                        "+
     "remain_amount as remainAmount,    "+
     "memo,                             "+
     "modify_time as  modifyTime,       "+
     "create_time  as   createTime       "+
     "from p_user                        "+
     "<where>                            "+
     "<if test='name!=null and name != \"\" '>             "+
     "    AND name like  CONCAT('%',#{name},'%')           "+
     "</if>                              "+
     "<if test='phone!=null and phone != \"\" '>            "+
     "    AND phone like  CONCAT('%',#{phone},'%')          "+
     "</if>                              "+
     "</where>                           "+
     "LIMIT #{start}, #{length}          "+
     "</script>                          "
    )
    List<PUser> getByPage( @Param("name") String name,
                           @Param("phone")String phone,
                           @Param("start")int start ,
                           @Param("length")int length);
    @Select(
            "<script>                                 "+
                    "SELECT  count(1)                         "+
                    "from p_user                        "+
                    "<where>                            "+
                    "<if test='name!=null and name != \"\" '>             "+
                    "    AND name like  CONCAT('%',#{name},'%')             "+
                    "</if>                              "+
                    "<if test='phone!=null and phone != \"\" '>            "+
                    "    AND phone like  CONCAT('%',#{phone},'%')          "+
                    "</if>                              "+
                    "</where>                           "+
                    "</script>                          "
    )
    int count( @Param("name") String name,
               @Param("phone")  String phone);
}