<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link rel="icon" href="/static/img/1.ico">
    <link href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/2.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/sweetalert.css">
</head>
<body>
<%@ include file="../include/navbar.jsp"%>

<c:if test="${not empty requestScope.message}">
    <div class="alert alert-success">
            ${requestScope.message}
    </div>
</c:if>
<c:if test="${not empty param.redirect}">
    <div class="alert alert-success">
        请登录后再继续操作
    </div>
</c:if>

<c:if test="${not empty requestScope.messages}">
    <div class="alert alert-success">
        请登录后再继续操作
    </div>
</c:if>
<div class="container">
    <div  class="row">
        <div class="col-xs-8 col-md-6">
            <div class="box">
                <div class="box-header">
                    <span class="title"><i class="fa fa-sign-in"></i> 登录</span>
                </div>

                <form action="" class="form-horizontal" id="loginForm">


                    <div class="control-group">
                        <label class="control-label">账号</label>
                        <div class="controls">
                            <input type="text" name="username">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">密码</label>
                        <div class="controls">
                            <input type="password" name="password" id="password">
                        </div>
                    </div>

                    <%--验证码--%>

                    <div class="control-group">
                        <label class="control-label">验证码</label>
                        <%-- <input type="hidden" name="patchcaCode" value="${requestScope.patchcaCode}">--%>
                        <div class="controls">
                            <input type="text" name="code" >
                        </div>
                        <div class="controls">
                            <a href="javascript:;" id="change">
                                <img id="img" src="/patchca.png" alt="">
                            </a>
                        </div>

                    </div>
                    <div class="control-group">
                        <label class="control-label"></label>
                        <div class="controls">
                            <a href="/foundpassword">忘记密码</a>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-primary" type="button" id="loginBtn">登录</button>

                        <a class="pull-right" href="/reg">注册账号</a>
                    </div>

                </form>
                <%--地图--%><%--谷歌地图  http://maps.google.co.in/--%>



            </div>
        </div>

        <div class="col-xs-8 col-md-6">
            <div class="map">
                <iframe width="100%" height="380" src="http://ditu.amap.com/?ie=UTF8&amp;ll=14.264383,79.804688&amp;spn=153.263776,68.554688&amp;t=m&amp;z=2&amp;output=embed"></iframe>
                <br>
                <small>
                    <a target="_blank" href="http://ditu.amap.com/?ie=UTF8&amp;ll=14.264383,79.804688&amp;spn=153.263776,68.554688&amp;t=m&amp;z=2&amp;source=embed" style="color:#FF8400;font-family: 'Carrois Gothic SC', sans-serif;text-align:left">查看大图</a>
                </small>
            </div>
        </div>
    </div>



    <!--box end-->
</div>
<!--container end-->
<script src="/static/js/jquery-1.11.1.js"></script>
<script src="/static/js/jquery.validate.min.js"></script>
<script src="/static/js/sweetalert.min.js"></script>
<script src="/static/js/user/login.js"></script>
</body>
</html>