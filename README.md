# 基于JavaEE的网上商城——零食商城

Copyright: Copyright (c) 2020   
Created on 2020-5-1  
Author:zengxiaochao666@gmail.com  
Version 2.0  

## 项目描述
### 这是大三下学期的JavaEE作业，JavaWeb，做的一个商城，实现的功能有：
1. 浏览主页商品、查看商品详情、下单商品、查看我的订单、注册用户等功能。
2. 管理员查看商品列表、进行销量或售价或库存进行排序，进行商品上下架。  
### 在线配置到了我的云服务器：  
1. 用户端：http://112.124.20.82:8080/market/index.jsp  
2. 管理员端：http://112.124.20.82:8080/market/admin.jsp  
在我的云服务器有效期内可以进行演示测试。

## 编译环境
Java:JDK1.8  
IDE:IDEA intellij  
数据库：Mysql5.7  
应用服务器：Tomcat8.5

## 部署步骤
1. mysql新建名为market的数据库，使用项目内存放的sql文件进行表的生成和数据的加载。  
2. 使用IDEA打开项目主路径，配置tomcat即可。  
3. 若有缺包，mysql5.7的jar包在我项目的web->WEB-INF->lib中，若还缺包爆红，导入tomcat中的lib中的jar。

## 目录结构描述
├── src // 后端  
│ ├── dao //dao层  
│ ├── entity // 实体类    
│ └── servlet // servlet  
├── web // 前端  
│ ├── css //css  
│ ├── js // js    
│ └── image // 图片资源  
├── market.sql //数据库文件  
└── ReadMe.md //help  

## 测试运行
    

    

## 版本更新
v1.0 项目框架的搭建、显示商品、简介商品详情。  
v2.0 注册、下单、查看我的订单、订单详情。  
v3.0 开放后台管理员入口admin.jsp，查看商品列表、进行销量或售价或库存进行排序，进行商品上下架。   










