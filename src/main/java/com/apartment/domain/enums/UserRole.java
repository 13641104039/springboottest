package com.apartment.domain.enums;

import lombok.Getter;

/**
 * 用户角色枚举
 */
@Getter
public enum UserRole {
    USER("用户"),
    LANDLORD("房东"),
    ADMIN("管理员");

    private final String description;

    UserRole(String description) {
        this.description = description;
    }
}

