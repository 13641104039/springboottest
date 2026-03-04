package com.apartment.domain.enums;

import lombok.Getter;

@Getter
public enum AppointmentStatus {
    PENDING("待确认"),
    CONFIRMED("已确认"),
    COMPLETED("已完成"),
    CANCELLED("已取消");

    private final String description;

    AppointmentStatus(String description) {
        this.description = description;
    }
}
