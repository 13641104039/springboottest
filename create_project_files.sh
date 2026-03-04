#!/bin/bash

# 这个脚本将创建项目的核心文件结构

# 创建更多枚举类
cat > src/main/java/com/apartment/domain/enums/UserStatus.java << 'EOF'
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
EOF

cat > src/main/java/com/apartment/domain/enums/PropertyStatus.java << 'EOF'
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
EOF

cat > src/main/java/com/apartment/domain/enums/AppointmentStatus.java << 'EOF'
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
EOF

cat > src/main/java/com/apartment/domain/enums/OrderStatus.java << 'EOF'
package com.apartment.domain.enums;

import lombok.Getter;

@Getter
public enum OrderStatus {
    PENDING("待支付"),
    PAID("已支付"),
    COMPLETED("已完成"),
    CANCELLED("已取消"),
    REFUNDED("已退款");

    private final String description;

    OrderStatus(String description) {
        this.description = description;
    }
}
EOF

cat > src/main/java/com/apartment/domain/enums/PaymentStatus.java << 'EOF'
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
EOF

echo "枚举类创建完成"
