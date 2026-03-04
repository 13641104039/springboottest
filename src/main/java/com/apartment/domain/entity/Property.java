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
