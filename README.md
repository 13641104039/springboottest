# 🏢 高端公寓租赁管理系统

一个功能完整的高端公寓租赁管理平台，采用前后端分离架构，支持用户租房、房东管理、管理员后台等多种角色功能。

## 📋 项目简介

本系统是一个面向高端公寓租赁市场的综合管理平台，提供房源发布、在线预约、智能推荐、在线支付、VR看房等功能。

### 核心功能

#### 👤 用户端
- 🏠 房源搜索与筛选（区域、价格、户型、设施）
- 🗺️ 地图找房（集成高德地图）
- 📱 房源详情展示（图片、VR看房、周边设施）
- 📅 在线预约看房
- ⭐ 收藏房源
- 💰 在线支付（支付宝、微信支付）
- 📝 订单管理
- 💬 评价系统
- 🎯 智能推荐

#### 🏘️ 房东端
- 📝 房源发布与管理
- 📊 数据统计（浏览量、预约量、收入）
- 👥 租客管理
- 📅 预约管理
- 💵 收入管理

#### 🔧 管理员后台
- 👥 用户管理
- 🏠 房源审核
- 📊 数据统计与分析
- ⚙️ 系统配置
- 📋 操作日志

## 🛠️ 技术栈

### 后端技术
- **框架**: Spring Boot 3.2.0
- **安全**: Spring Security + JWT
- **数据库**: MySQL 8.0
- **ORM**: MyBatis Plus 3.5.5
- **缓存**: Redis
- **搜索**: Elasticsearch
- **消息队列**: RabbitMQ
- **文件存储**: 阿里云OSS
- **支付**: 支付宝SDK、微信支付SDK
- **API文档**: SpringDoc OpenAPI 3

### 前端技术
- **框架**: Vue 3 + TypeScript
- **构建工具**: Vite
- **UI组件**: Element Plus
- **状态管理**: Pinia
- **路由**: Vue Router
- **HTTP客户端**: Axios
- **图表**: ECharts
- **地图**: 高德地图API

## 📁 项目结构

```
high-end-apartment/
├── src/
│   ├── main/
│   │   ├── java/com/apartment/
│   │   │   ├── ApartmentApplication.java          # 应用入口
│   │   │   ├── config/                            # 配置类
│   │   │   │   ├── SecurityConfig.java            # Security配置
│   │   │   │   ├── RedisConfig.java               # Redis配置
│   │   │   │   ├── CorsConfig.java                # 跨域配置
│   │   │   │   └── JwtProperties.java             # JWT配置
│   │   │   ├── security/                          # 安全相关
│   │   │   │   ├── JwtTokenProvider.java          # JWT工具类
│   │   │   │   ├── JwtAuthenticationFilter.java   # JWT过滤器
│   │   │   │   └── UserDetailsServiceImpl.java    # 用户详情服务
│   │   │   ├── domain/                            # 领域模型
│   │   │   │   ├── entity/                        # 实体类
│   │   │   │   │   ├── User.java                  # 用户实体
│   │   │   │   │   ├── Property.java              # 房源实体
│   │   │   │   │   ├── Appointment.java           # 预约实体
│   │   │   │   │   ├── Order.java                 # 订单实体
│   │   │   │   │   └── ...
│   │   │   │   └── enums/                         # 枚举类
│   │   │   │       ├── UserRole.java              # 用户角色
│   │   │   │       ├── PropertyStatus.java        # 房源状态
│   │   │   │       └── ...
│   │   │   ├── controller/                        # 控制器
│   │   │   │   ├── AuthController.java            # 认证控制器
│   │   │   │   ├── PropertyController.java        # 房源控制器
│   │   │   │   ├── AppointmentController.java     # 预约控制器
│   │   │   │   ├── OrderController.java           # 订单控制器
│   │   │   │   ├── UserController.java            # 用户控制器
│   │   │   │   └── AdminController.java           # 管理员控制器
│   │   │   ├── service/                           # 服务层
│   │   │   │   ├── UserService.java
│   │   │   │   ├── PropertyService.java
│   │   │   │   ├── AppointmentService.java
│   │   │   │   ├── OrderService.java
│   │   │   │   ├── PaymentService.java
│   │   │   │   ├── SearchService.java             # 搜索服务
│   │   │   │   ├── RecommendationService.java     # 推荐服务
│   │   │   │   └── impl/                          # 实现类
│   │   │   ├── mapper/                            # MyBatis Mapper
│   │   │   ├── dto/                               # 数据传输对象
│   │   │   ├── vo/                                # 视图对象
│   │   │   ├── common/                            # 通用类
│   │   │   │   ├── Result.java                    # 统一响应
│   │   │   │   └── PageResult.java                # 分页响应
│   │   │   └── utils/                             # 工具类
│   │   └── resources/
│   │       ├── application.yml                    # 主配置文件
│   │       ├── application-dev.yml                # 开发环境配置
│   │       ├── application-prod.yml               # 生产环境配置
│   │       └── db/                                # 数据库脚本
│   │           ├── schema.sql                     # 表结构
│   │           └── data.sql                       # 初始数据
│   └── test/                                      # 测试代码
├── frontend/                                      # 前端项目
│   ├── src/
│   │   ├── views/                                 # 页面
│   │   │   ├── Home.vue                           # 首页
│   │   │   ├── PropertyList.vue                   # 房源列表
│   │   │   ├── PropertyDetail.vue                 # 房源详情
│   │   │   ├── UserCenter.vue                     # 用户中心
│   │   │   ├── landlord/                          # 房东端
│   │   │   └── admin/                             # 管理后台
│   │   ├── components/                            # 组件
│   │   ├── router/                                # 路由
│   │   ├── store/                                 # 状态管理
│   │   ├── api/                                   # API接口
│   │   └── utils/                                 # 工具类
│   ├── package.json
│   └── vite.config.ts
├── docs/                                          # 文档
│   ├── API.md                                     # API文档
│   ├── DEPLOY.md                                  # 部署文档
│   └── ARCHITECTURE.md                            # 架构文档
├── pom.xml                                        # Maven配置
└── README.md                                      # 项目说明
```

## 🗄️ 数据库设计

### 核心表结构

1. **user** - 用户表
   - 存储用户基本信息、角色、状态等
   - 支持用户、房东、管理员三种角色

2. **property** - 房源表
   - 存储房源详细信息
   - 包含位置、价格、设施等信息
   - 支持全文搜索

3. **property_image** - 房源图片表
   - 存储房源图片URL
   - 支持普通图片和全景图片

4. **appointment** - 预约表
   - 存储看房预约信息
   - 支持预约状态管理

5. **order** - 订单表
   - 存储租赁订单信息
   - 包含租期、金额等

6. **payment** - 支付记录表
   - 存储支付流水
   - 支持多种支付方式

7. **favorite** - 收藏表
   - 存储用户收藏的房源

8. **review** - 评价表
   - 存储用户对房源的评价

9. **user_behavior** - 用户行为表
   - 记录用户浏览、收藏等行为
   - 用于智能推荐

10. **operation_log** - 操作日志表
    - 记录系统操作日志

11. **system_config** - 系统配置表
    - 存储系统配置信息

详细的数据库设计请查看 `src/main/resources/db/schema.sql`

## 🚀 快速开始

### 环境要求

- JDK 17+
- Maven 3.6+
- MySQL 8.0+
- Redis 6.0+
- Elasticsearch 8.0+
- RabbitMQ 3.11+
- Node.js 18+

### 后端启动

1. **克隆项目**
```bash
git clone <repository-url>
cd high-end-apartment
```

2. **创建数据库**
```sql
CREATE DATABASE apartment_system CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

3. **导入数据库**
```bash
mysql -u root -p apartment_system < src/main/resources/db/schema.sql
mysql -u root -p apartment_system < src/main/resources/db/data.sql
```

4. **配置application-dev.yml**
```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/apartment_system
    username: root
    password: your_password
  data:
    redis:
      host: localhost
      port: 6379
```

5. **启动Redis**
```bash
redis-server
```

6. **启动Elasticsearch**
```bash
./bin/elasticsearch
```

7. **启动RabbitMQ**
```bash
rabbitmq-server
```

8. **运行项目**
```bash
mvn clean install
mvn spring-boot:run
```

后端服务将在 `http://localhost:8080/api` 启动

### 前端启动

1. **进入前端目录**
```bash
cd frontend
```

2. **安装依赖**
```bash
npm install
# 或
yarn install
```

3. **启动开发服务器**
```bash
npm run dev
# 或
yarn dev
```

前端应用将在 `http://localhost:5173` 启动

## 📖 API文档

启动后端服务后，访问以下地址查看API文档：

- Swagger UI: http://localhost:8080/api/swagger-ui.html
- OpenAPI JSON: http://localhost:8080/api/v3/api-docs

## 🔐 默认账号

系统初始化后会创建以下测试账号（密码均为 `123456`）：

| 用户名 | 角色 | 说明 |
|--------|------|------|
| admin | 管理员 | 系统管理员账号 |
| landlord1 | 房东 | 测试房东账号1 |
| landlord2 | 房东 | 测试房东账号2 |
| user1 | 用户 | 测试用户账号1 |
| user2 | 用户 | 测试用户账号2 |

## 🔧 配置说明

### JWT配置
```yaml
jwt:
  secret: your-secret-key-min-256-bits
  expiration: 86400000  # 24小时
```

### 阿里云OSS配置
```yaml
aliyun:
  oss:
    endpoint: oss-cn-beijing.aliyuncs.com
    access-key-id: your-access-key-id
    access-key-secret: your-access-key-secret
    bucket-name: your-bucket-name
```

### 支付配置
```yaml
alipay:
  app-id: your-app-id
  private-key: your-private-key
  public-key: alipay-public-key

wechat:
  pay:
    app-id: your-app-id
    mch-id: your-mch-id
    api-v3-key: your-api-v3-key
```

## 📊 核心功能实现

### 1. 认证授权
- 基于JWT的无状态认证
- Spring Security权限控制
- 支持多角色权限管理

### 2. 房源搜索
- Elasticsearch全文搜索
- 多条件筛选（价格、区域、户型等）
- 地理位置搜索

### 3. 智能推荐
- 基于用户行为的协同过滤
- 相似房源推荐
- Redis缓存推荐结果

### 4. 支付集成
- 支付宝支付
- 微信支付
- 支付回调处理
- 退款功能

### 5. 预约系统
- 时间冲突检测
- Redis分布式锁
- 预约提醒（RabbitMQ）

### 6. 文件上传
- 阿里云OSS存储
- 图片压缩
- 支持多图上传

## 🎯 高级特性

### VR看房
- 360°全景图片展示
- Three.js 3D渲染
- WebVR支持

### 智能定价
- 基于机器学习的租金预测
- 多维度特征分析
- 价格趋势分析

### 数据统计
- ECharts可视化
- 实时数据更新
- 多维度数据分析

## 🔒 安全特性

- HTTPS全站加密
- SQL注入防护
- XSS攻击防护
- CSRF防护
- 接口限流
- 敏感数据脱敏
- 操作日志审计

## 📱 响应式设计

- 支持PC端、平板、手机
- 自适应布局
- PWA支持

## 🧪 测试

```bash
# 运行单元测试
mvn test

# 运行集成测试
mvn verify
```

## 📦 部署

### Docker部署

```bash
# 构建镜像
docker build -t apartment-system .

# 运行容器
docker-compose up -d
```

### Kubernetes部署

```bash
kubectl apply -f k8s/
```

详细部署文档请查看 `docs/DEPLOY.md`

## 🤝 贡献

欢迎提交Issue和Pull Request！

## 📄 许可证

MIT License

## 📞 联系方式

- 邮箱: support@apartment.com
- 电话: 400-888-8888

## 🙏 致谢

感谢所有开源项目的贡献者！

---

**注意**: 
1. 生产环境请修改所有默认密码和密钥
2. 配置文件中的敏感信息请使用环境变量
3. 定期备份数据库
4. 启用HTTPS
5. 配置防火墙规则

