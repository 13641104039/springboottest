#!/bin/bash

# 创建Application主类
cat > src/main/java/com/apartment/ApartmentApplication.java << 'EOF'
package com.apartment;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.apartment.mapper")
@EnableCaching
@EnableAsync
@EnableScheduling
public class ApartmentApplication {
    public static void main(String[] args) {
        SpringApplication.run(ApartmentApplication.class, args);
    }
}
EOF

# 创建基础实体类
cat > src/main/java/com/apartment/domain/entity/BaseEntity.java << 'EOF'
package com.apartment.domain.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class BaseEntity implements Serializable {
    
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;
    
    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updatedAt;
}
EOF

# 创建User实体
cat > src/main/java/com/apartment/domain/entity/User.java << 'EOF'
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
EOF

# 创建Property实体
cat > src/main/java/com/apartment/domain/entity/Property.java << 'EOF'
package com.apartment.domain.entity;

import com.apartment.domain.enums.PropertyStatus;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("property")
public class Property extends BaseEntity {
    
    @TableId(type = IdType.AUTO)
    private Long id;
    
    private Long landlordId;
    
    private String title;
    
    private String description;
    
    private String province;
    
    private String city;
    
    private String district;
    
    private String address;
    
    private BigDecimal longitude;
    
    private BigDecimal latitude;
    
    private BigDecimal area;
    
    private Integer roomCount;
    
    private Integer hallCount;
    
    private Integer bathroomCount;
    
    private Integer floor;
    
    private Integer totalFloors;
    
    private String orientation;
    
    private String decoration;
    
    private BigDecimal rentPrice;
    
    private BigDecimal deposit;
    
    private String paymentMethod;
    
    private String facilities;
    
    private String nearbyFacilities;
    
    private String coverImage;
    
    private String vrUrl;
    
    private PropertyStatus status;
    
    private Integer viewCount;
    
    private Integer favoriteCount;
}
EOF

echo "核心实体类创建完成"
