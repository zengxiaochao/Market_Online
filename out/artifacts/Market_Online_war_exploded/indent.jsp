<%--
  Created by IntelliJ IDEA.
  User: Z
  Date: 2020-05-14
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link id="css" rel="stylesheet" type="text/css" href="./CSS/others.css"  />
<html>
<head>
    <title>提交订单</title>
</head>
<body>
    <div style="float: left;width: 100%;height: 1000px;background-color: #1E90FF;">


        <div style="float: left;width: 20%;height: 1000px;background-color: #cccccc;">

        </div>
        <div style="float: left;width: 60%;height: 1000px;background-color: grey;">
            <div style="float: left;width: 100%;height: 100px;background-color: blueviolet;">

            </div>
            <div style="text-align:center;float: left;width: 100%;height: 900px;background-color: antiquewhite;">
                <div style="float: left;width: 30%;height: 100px;background-color: blueviolet;">

                </div>

                <div style="float: left;width: 40%;height: 100px;background-color: blueviolet;">
                    <table class="gridtable">
                        <tr>
                            <th>订单号</th><td><%=request.getParameter("product_name")%></td>
                        </tr>
                        <tr>
                            <th>用户名</th><td><%=request.getParameter("a") %></td>
                        </tr>
                        <tr>
                            <th>订单时间</th><td><%=request.getParameter("b") %></td>
                        </tr>
                        <tr>
                            <th>货物</th><td>Text 2B</td>
                        </tr>
                        <tr>
                            <th>数量</th><td>Text 2B</td>
                        </tr>
                        <tr>
                            <th>地址</th><td>Text 2B啊啊啊啊啊</td>
                        </tr>
                    </table>
                    <br><br>
                    <button class="button_1" onclick="click_indent()">提交订单</button>
                </div>

                <div style="float: left;width: 30%;height: 100px;background-color: blueviolet;">

                </div>


            </div>

        </div>
        <div style="float: left;width: 20%;height: 100px;background-color: cadetblue;">
        </div>
    </div>
</body>
</html>
