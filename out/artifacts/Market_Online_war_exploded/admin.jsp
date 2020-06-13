<%@ page import="entity.Goods" %>
<%@ page import="dao.GoodsDao" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="other.EmpComparator" %><%--
  Created by IntelliJ IDEA.
  User: Z
  Date: 2020-06-12
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="./CSS/admin.css">
    <script charset="utf-8" type="text/javascript" src="./js/admin.js"></script>
    <title>管理员</title>
</head>
<body>
    <div style="float: left;width: 100%;height: 20px;background-color:azure;">
        <!--上边栏空白占位  -->
    </div>
    <div style="float: left;width: 20%;height: 1000px;background-color: aqua;">
        <!--左边栏空白占位  -->

    </div>
    <%
        List<Goods> good_list = GoodsDao.allgoods_query();
        session.setAttribute("sort","1");
    %>
    <div style="float: left;width: 60%;height: 1000px;">
        <table id="table1">
            <tr>
                <th colspan="5" style="text-align: center;">商品表</th>
            </tr>

            <tr>
                <td>商品名</td>
                <td>
                    <button id="th1" class="button10" style="vertical-align: middle" onclick="sort2('1')"><span>库存</span></button>
                </td>
                <td>
                    <button id="th2" class="button10" style="vertical-align: middle" onclick="sort2('2')"><span>销量</span></button>
                </td>
                <td>
                    <button id="th3" class="button10" style="vertical-align: middle" onclick="sort2('3')"><span>价格</span></button>
                </td>
                <td>
                    管理
                </td>
            </tr>

            <%
                for (Goods g:good_list)
                {
                    String goods_name = g.getGoods_name();
                    int num = g.getNum();
                    int sale = g.getSales();
                    double prize = g.getPrice();
                %>
                <tr>

                        <td name="td0"><%=goods_name%></td>
                        <td name="td1"><%=num%></td>
                        <td name="td2"><%=sale%></td>
                        <td >￥<span name="td3"><%=prize%></span></td>

                            <input name="product_up" value="<%=g.getProject_deleted()%>" style="display:none">
                            <%
                                if(g.getProject_deleted().equals("1"))
                                {
                                    %>
                                <td name="td4"><button class="button12" style="background: rosybrown" onclick="up_down('<%=goods_name%>')">上架</button></td>

                                <%
                                }else{
                            %>
                                <td name="td4"><button class="button12" onclick="up_down('<%=goods_name%>')">下架</button></td>
                            <%}%>

                </tr>

                <%
                }
             %>

        </table>
    </div>
    <div style="float: left;width: 20%;height: 1000px;background-color: aqua;">
        <!--右边栏空白占位  -->
    </div>
</body>
</html>
