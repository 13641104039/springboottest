package com.apartment.domain.enums;

import lombok.Getter;

@Getter
public enum PropertyStatus {
    PENDING("待审核"),
    APPROVED("已通过"),
    REJECTED("已拒绝"),
    RENTED("已出租"),
    OFFLINE("已下架");

    private final String description;

    PropertyStatus(String description) {
        this.description = description;
    }
}
