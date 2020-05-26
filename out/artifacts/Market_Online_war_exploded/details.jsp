<%@ page import="entity.Goods" %>
<%@ page import="dao.GoodsDao" %><%--
  Created by IntelliJ IDEA.
  User: Z
  Date: 2020-05-01
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link id="css" rel="stylesheet" type="text/css" href="./CSS/others.css"  />

<html>
<head>
    <title>商品详情</title>
</head>
<script>
    function click_indent()
    {
        var href = "indent.jsp?product_name=te&&a=1&&b=2";
        window.location.href = href;
    }
</script>
<body>


    <div style="width: 100%;height: 100%;">

        <div style="float: left;width: 20%;height: 1000px;background-color: aqua;">
            <!--左边栏空白占位  -->
        </div>
        <div style="float: left;width: 60%;height: 600px;">
            <%
                Goods g = GoodsDao.goods_query(request.getParameter("product_name"));
                String goods_name = g.getGoods_name();
            %>
            <div style="float: left;width: 100%;height: 100px;background-color: grey;">
            <%--            商品上方留白--%>
            </div>
            <div style="float: left;width: 100%;height: 400px;">
                <%--
                左边商品状态
                --%>
                <div style="text-align:center;float: left;width: 50%;height: 300px;">
                    <div>
                        <img src="<%=g.getGoods_url(goods_name) %>" style="width: 30%;">
                    </div>
                    <div>
                        <p><%=goods_name %></p>
                        <p>销量：<%=g.getSales() %></p>
                        <p>库存：<span style="color:green"><%=g.getNum() %></span></p>
                        <p>价格：￥<%=g.getPrice() %></p>
                    </div>
                </div>
                <%--
                右边按钮
                --%>
                <div style="text-align:center;float: left;width: 50%;height: 300px;background-color: chartreuse;">
                    <br><br>
                    <h3>购买数量</h3>
                    <input type="text" name="num" size="2"  maxlength="3" value="1" style="border: 1px solid #ccc;padding: 7px 0px;padding-left:5px;">
                    <br><br>
                    <button class="button_1" onclick="click_indent()">立即购买</button>
                </div>
            </div>


            <div style="text-align:center;float: left;width: 100%;height: 600px;">
                <h1>商品详情：</h1>
                <img src="<%=g.getGoods_url(goods_name+"details") %>" style="width: 80%;">
            </div>

<%--            <% String name = "./image/"+request.getParameter("product_name")+".jpg"; %>--%>
<%--            <div style="color: #fff;padding: 50px;--%>
<%--                    font-size: 15px;height: 60px;--%>
<%--                    background-image: url(<%=name %>);">--%>
<%--            </div>--%>
<%--            <div class="bodyBox" >--%>
<%--                <p>aaa</p>--%>
<%--                <p>销量：<%=g.getSales() %></p>--%>
<%--                <p>库存：<span style="color:green"><%=g.getNum() %></span></p>--%>
<%--                <p>价格：￥<%=g.getPrice() %></p>--%>
<%--            </div>--%>
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
