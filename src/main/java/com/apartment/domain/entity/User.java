package com.apartment.domain.entity;

import com.apartment.domain.enums.UserRole;
import com.apartment.domain.enums.UserStatus;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("user")
public class User extends BaseEntity {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    private String username;
    
    @JsonIgnore
    private String password;
    
    private String email;
    
    private String phone;
    
    private String realName;
    
    private String idCard;
    
    private String avatar;
    
    private UserRole role;
    
    private UserStatus status;
    
    private Integer creditScore;
    
    private Boolean verified;
}
