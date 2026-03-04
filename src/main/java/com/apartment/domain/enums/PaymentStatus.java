package com.apartment.domain.enums;

import lombok.Getter;

@Getter
public enum PaymentStatus {
    PENDING("待支付"),
    SUCCESS("成功"),
    FAILED("失败"),
    REFUNDED("已退款");

    private final String description;

    PaymentStatus(String description) {
        this.description = description;
    }
}
