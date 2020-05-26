<%@ page import="entity.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.GoodsDao" %><%--
  Created by IntelliJ IDEA.
  User: Z
  Date: 2020-04-27
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link id="css" rel="stylesheet" type="text/css" href="./CSS/index.css"  />
<html>
  <head>
    <title>零食商城</title>
      <script>
          function click_line()
          {
              var a='<%=session.getAttribute("name")%>';
              if(a == "null")
              {
                  alert("请先登录账号！！！");
              }
              else
              {
                  var goods_name = arguments[0];
                  // alert(goods_name.toString());
                  var href = "details.jsp?product_name="+goods_name.toString();
                  window.location.href = href;
              }
          }
      </script>
  </head>
  <body>
    <div style="width: 100%;height: 100%;">

      <div style="float: left;width: 100%;height: 100px;background-color: ivory;">
        <img src="image/公告.jpg" alt="" style="width: 100%;height: 100px;">
      </div>

      <div style="float: left;width: 20%;height: 1000px;background-color: aqua;">
        <!--左边栏空白占位  -->
      </div>
      <div style="float: left;width: 60%;height: 1000px;">
        <!-- <div style="float: left;width: 100%;height: 80px;text-align:center;">
            <h1>零食选购</h1>
        </div> -->
        <div style="float: left;width: 2%;height: 1000px;">

        </div>
        <!-- 零食卡片 -->
        <div style="float: left;width: 98%;height: 1000px;">
          <%
            List<Goods> good_list = GoodsDao.allgoods_query();
            for (Goods g:good_list)
            {
                String goods_name = g.getGoods_name();
              %>
                <div class="cardBox" onclick="click_line('<%=goods_name %>')">
                  <div class="headerBox" style="background-image: url(<%=g.getGoods_url(goods_name) %>);">
<%--                    <p><%=g.getGoods_name() %></p>--%>
                  </div>
                  <div class="bodyBox" >
                    <p><%=goods_name %></p>
                    <p>销量：<%=g.getSales() %></p>
                    <p>库存：<span style="color:green"><%=g.getNum() %></span></p>
                    <p>价格：￥<%=g.getPrice() %></p>
                  </div>
                </div>
              <%
            }
          %>
        </div>
      </div>

      <div style="float: left;width: 20%;height: 1000px;background-color: hotpink;text-align:center;">
        <!--右边栏  -->
        <center>
          <% if(session.getAttribute("name") == null)
          {
          %>
            <div style="margin-top:150px;">
              <form action="LoginPost" method="post" onSubmit="return denglu(this)" id="loginForm" name="loginForm">

                <input  type="text" name="name" placeholder="请输入用户名" ><br>
                <br>
                <input type="password" name="pwd" placeholder="请输入密码"><br>
                <br>
                <button type="submit">登&emsp;陆</button>
                <br>
                <button type="submit">注&emsp;册</button>
              </form>
            </div>
          <% }
          else{
            %>
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
          <%
          }
          %>
        </center>
      </div>
    </div>



  </body>
  <script type="text/javascript">
    function denglu(form){
      if(form.name.value==""){
        alert("用户名不能为空！！");
        form.uname.focus();
        return false;
      }
      if(form.pwd.value==""){
        alert("密码不能为空！！");
        form.pwd.focus();
        return false;
      }
    }
  </script>
</html>
