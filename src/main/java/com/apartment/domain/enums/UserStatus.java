package com.apartment.domain.enums;

import lombok.Getter;

@Getter
public enum UserStatus {
    ACTIVE("正常"),
    DISABLED("禁用");

    private final String description;

    UserStatus(String description) {
        this.description = description;
    }
}
