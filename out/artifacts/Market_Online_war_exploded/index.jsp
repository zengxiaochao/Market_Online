<%@ page import="entity.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.GoodsDao" %>
<%@ page import="dao.UserDao" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Z
  Date: 2020-04-27
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link id="css" rel="stylesheet" type="text/css" href="./CSS/index.css"  />
<script charset="utf-8" type="text/javascript" src="./js/index.js"></script>
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
                //已下架
                if(g.getProject_deleted().equals("1"))
                    continue;
                String goods_name = g.getGoods_name();
              %>
                <div class="cardBox" onclick="click_line('<%=goods_name %>')">
                  <div class="headerBox" style="background-image: url(<%=g.getIcon_url() %>);">
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
              </form>
                <button onclick="displayWindow()">注&emsp;册</button>
            </div>
          <% }
          else{
            %>
            <div>

                <div style="">
                    <a href="myindent.jsp" >
                        查询我的订单
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


<%--  注册弹窗--%>
    <!--悬浮窗口-->
    <div id="window" class="window_css" style="text-align:center;">
        <form action="Registered" onSubmit="return zhuce(this)" >
            账&emsp;&emsp;号：<input type="text" name="re_name"><br><br>
            密&emsp;&emsp;码：<input type="password" name="re_pwd"><br><br>
            确认密码：<input type="password" name="re_rpwd"><br><br>
            电话号码：<input type="text" name="re_tel"><br><br>
            所在省份：<input type="text" name="re_address"><br><br>
            详细地址：<input type="text" name="re_address_all"><br><br>
            快递收件人：<input type="text" name="re_address_who"><br><br>
            <button type="submit">提交注册</button>
        </form>
        <button onclick="hideWindow()">取&emsp;消</button>

    </div>
    <!--出现悬浮窗口后,背景变暗-->
    <div id="shadow" class="shadow_css"></div>


  </body>
  <script type="text/javascript">
    function denglu(form){
      if(form.name.value==""){
        alert("用户名不能为空！！");
        form.name.focus();
        return false;
      }
      if(form.pwd.value==""){
        alert("密码不能为空！！");
        form.pwd.focus();
        return false;
      }
    }
    function zhuce(form) {
        if(form.re_name.value==""){
            alert("账号不能为空！！");
            form.re_name.focus();
            return false;
        }
        if(form.re_pwd.value==""){
            alert("密码不能为空！！");
            form.re_pwd.focus();
            return false;
        }
        if(form.re_rpwd.value==""){
            alert("请输入两次密码！！");
            form.re_rpwd.focus();
            return false;
        }
        if(form.re_tel.value==""){
            alert("电话不能为空！！");
            form.re_tel.focus();
            return false;
        }
        if(form.re_address.value==""){
            alert("地址不能为空！！");
            form.re_address.focus();
            return false;
        }
        if(form.re_address_all.value==""){
            alert("详细地址不能为空！！");
            form.re_address_all.focus();
            return false;
        }
        if(form.re_address_who.value==""){
            alert("收件人不能为空！！");
            form.re_address_who.focus();
            return false;
        }
        if(form.re_pwd.value!=form.re_rpwd.value){
            alert("两次输入密码不同！！");
            form.re_rpwd.focus();
            return false;
        }
    }
  </script>


<%--  /*注册弹窗的样式*/--%>

  <style>
      .shadow_css {
          display: none;
          position: absolute;
          top: 0%;
          left: 0%;
          width: 100%;
          height: 100%;
          background-color: black;
          z-index: 10;
          /* 为mozilla firefox 设置透明度  */
          -moz-opacity: 0.6;
          /* 设置透明度 */
          opacity: .60;
          /* 为IE 设置透明度  */
          filter: alpha(opacity=66);
      }

      .window_css {
          display: none;
          position: absolute;
          top: 20%;
          left: 25%;
          width: 50%;
          height: 60%;
          border: 3px solid honeydew;
          background-color: aliceblue;
          z-index: 11;
      }
  </style>

</html>
