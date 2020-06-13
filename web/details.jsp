<%@ page import="entity.Goods" %>
<%@ page import="dao.GoodsDao" %><%--
  Created by IntelliJ IDEA.
  User: Z
  Date: 2020-05-01
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" href="./CSS/details.css">
    <script charset="utf-8" type="text/javascript" src="./js/details.js"></script>

</head>
<body>


    <div style="width: 100%;height: 100%;">
        <div style="float: left;width: 100%;height: 100px;background-color: grey;">
            <%--            页面上方留白--%>
        </div>
        <div style="float: left;width: 20%;height: 1000px;background-color: aqua;">
            <!--左边栏空白占位  -->
        </div>
        <div style="float: left;width: 60%;height: 600px;">
            <%
                Goods g = GoodsDao.goods_query(request.getParameter("product_name"));
                String goods_name = g.getGoods_name();
                String goods_details_text = g.getDetails_text();
                String goods_spec = g.getSpec();
                int product_id = g.getProject_id();
            %>
            <div style="float: left;width: 100%;height: 100px;">
                <%--            商品上方留白--%>
            </div>
            <div class="center_con clearfix" style="float: left;width: 100%;height: 600px;">
                <div class="main_menu fl"><img src="<%=g.getIcon_url() %>"></div>
                <div class="goods_detail_list fr">
                    <h3 id="goods_name"><%=goods_name %></h3>
                    <p><%=goods_details_text%></p>
                    <div class="prize_bar">
                        <div  class="show_prize fl">￥<em id="show_prize"><%=g.getPrice() %></em></div>
                        <div class="show_unit fl">单位：<%=goods_spec%></div>
                    </div>
                    <div class="goods_num clearfix">
                        <div class="num_name fl">数量：</div>
                        <div class="num_add fl">
                            <input id="buy_num" type="text" class="num_show fl" name="buy_num" oninput="num_change()" maxlength="4" value="1">
                            <a class="add fr" onclick="num_add()">+</a>
                            <a class="minus fr" onclick="num_minus()">-</a>
                        </div>
                    </div>
                    <div class="total">总价：<em>￥</em><em id="all_prize"><%=g.getPrice() %></em></div>
                    <div class="operate_btn" onclick="buy()">
                        <a class="buy_btn">立即购买</a>
                    </div>
                </div>
            </div>
            <div style="text-align:center;float: left;width: 100%;height: 600px;">
                <h1>商品详情：</h1>

                <img src="<%=g.getDetails_img_url() %>" style="width: 80%;">
                <p id="product_id"><%=product_id%></p>
            </div>
        </div>



        <div style="float: left;width: 20%;height: 1000px;background-color: hotpink;text-align:center;">
            <div>

                <div style="">
                    <a href="Logout" >
                        查询我的订单
                    </a>

                    <a href="Logout">
                        更改个人信息
                    </a>
                    <a href="Logout">
                        注销
                    </a>
                </div>
                <iframe src="personal.jsp" width="100%" height="100%" frameborder="0">

                </iframe>

            </div>
        </div>
    </div>
</body>
</html>
