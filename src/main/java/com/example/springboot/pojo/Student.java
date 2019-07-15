package com.example.springboot.pojo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.NotBlank;
import java.util.Date;
@ApiModel
public class Student {
    @ApiModelProperty(value = "学号", required = true)
    @NotBlank(message = "学号不能为空")
    private Integer id;
   // private Integer student_id;
    private String name;
    private Integer age;
   // private String sex;
   // private Date birthday;

    public Student(){}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }


}
