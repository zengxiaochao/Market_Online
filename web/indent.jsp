<%@ page import="entity.Goods" %>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dao.AddressDao" %>
<%@ page import="entity.Address" %>
<%--
  Created by IntelliJ IDEA.
  User: Z
  Date: 2020-05-14
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提交订单</title>
    <link id="css" rel="stylesheet" type="text/css" href="./CSS/indent.css"  />
</head>
<body>
    <%
        Goods g = GoodsDao.goods_query_id(Integer.parseInt(request.getParameter("product_id")));
        int buy_num = Integer.parseInt(request.getParameter("buy_num"));
        String goods_name = g.getGoods_name();
        String icon_url = g.getIcon_url();
        double prize = g.getPrice();

        String user_name = (String) session.getAttribute("name");
        Address address = AddressDao.Get_Address(user_name);
        String tel = address.getTel();
        String address_1 = address.getAddress();
        String address_all = address.getAddress_all();
        String address_who = address.getAddress_who();
    %>


    <div class="Caddress">
        <div class="add_mi">
            <p style="border-bottom:1px dashed #ccc;line-height:28px;"><%=address_1%>(<%=address_who%>收)</p>
            <p><%=address_all%> <%=tel%></p>
        </div>
    </div>

    <div class="shopping_content">
        <form action="Indent_servlet" method="post">
            <div class="shopping_table">
                <table border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center;">
                    <tr>
                        <th>商品图片</th>
                        <th>商品名称</th>
                        <th>商品价格</th>
                        <th>商品数量</th>
                    </tr>
                    <tr>
                        <td>
                            <a><img src=<%=icon_url%> /></a>
                        </td>
                        <td><span><input class="momey_input" style="width: 90px" name="goods_name" value="<%=goods_name%>" readonly="readonly" ></span></td>

                        <td>
                            <span class="span_momey">
                                <input class="momey_input" value="<%=prize%>" readonly="readonly" >
                                </span>
                        </td>

                        <td>
                            <input class="momey_input" type="" name="buy_num" value="<%=buy_num%>" readonly="readonly" >
                        </td>

                    </tr>


                </table>
                <div class="" style="width: 100%; text-align: right; margin-top: 10px;">
                    <div class="div_outMumey" style="float: left;">
                        总价：￥<span class="out_momey" ><input class="momey_input" name="prize" value="<%=buy_num*prize%>" readonly="readonly" ><%=buy_num*prize%></span>
                    </div>
                    <button class="btn_closing" type="submit">结算</button>
                </div>

            </div>
        </form>
    </div>
</body>
</html>
