<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <%--<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">--%>
    <link rel="icon" href="/static/img/1.ico">
    <link href="http://cdn.bootcss.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/2.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../static/css/style.css">
    <link rel="stylesheet" href="/static/jquery-jplayer/css/lanrenzhijia.css" type="text/css" />
    <style></style>
</head>
<body>
<%@ include file="include/navbar.jsp" %>

<div class="container">
    <div class="pull-right">    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
        音乐
    </button>
    </div>


    <!-- Button trigger modal -->
    <!-- Button trigger modal -->

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                </div>
                <div class="modal-body">
                    <%----%>
                        <div style="text-align:center;clear:both">
                            <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
                            <script src="/follow.js" type="text/javascript"></script>
                        </div>
                        <div class="music-player">
                            <div class="info">
                                <div class="left"> <a href="javascript:;" class="icon-shuffle"></a> <a href="javascript:;" class="icon-heart"></a> </div>
                                <div class="center">
                                    <div class="jp-playlist">
                                        <ul>
                                            <li></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="right"> <a href="javascript:;" class="icon-repeat"></a> <a href="javascript:;" class="icon-share"></a> </div>
                                <div class="progress jp-seek-bar"> <span class="jp-play-bar" style="width: 0%"></span> </div>
                            </div>
                            <div class="controls">
                                <div class="current jp-current-time">00:00</div>
                                <div class="play-controls">
                                    <a href="javascript:;" class="icon-previous jp-previous" title="previous"></a>
                                    <a href="javascript:;" class="icon-play jp-play" title="play"></a>
                                    <a href="javascript:;" class="icon-pause jp-pause" title="pause"></a>
                                    <a href="javascript:;" class="icon-next jp-next" title="next"></a>
                                </div>
                                <div class="volume-level jp-volume-bar">
                                    <span class="jp-volume-bar-value" style="width: 0%"></span>
                                    <a href="javascript:;" class="icon-volume-up jp-volume-max" title="max volume"></a>
                                    <a href="javascript:;" class="icon-volume-down jp-mute" title="mute"></a>
                                </div>
                            </div>
                            <div id="jquery_jplayer" class="jp-jplayer"></div>
                        </div>

                    <%----%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="box">
        <div class="talk-item">
            <ul class="topic-type unstyled inline" style="margin-bottom:0px;">
                <li class="${empty param.nodeid?'active':''}"><a href="/home">全部</a></li>
                <c:forEach items="${nodeList}" var="node">
                    <li class="${node.id == param.nodeid?'active':'' }"><a href="/home?nodeid=${node.id}">${node.nodename}</a></li>
                </c:forEach>

            </ul>
        </div>

        <c:forEach items="${page.items}" var="topic">
        <div class="talk-item">
            <table class="talk-table">
                <tr>
                    <td width="50">
                        <img class="avatar" src="${topic.user.avatar}?imageView2/1/w/40/h/40" alt="">
                    </td>
                    <td width="80">
                        <a href="">${topic.user.username}</a>
                    </td>
                    <td width="auto">
                        <a href="/topicDetail?topicid=${topic.id}">${topic.title}</a>
                    </td>
                    <td width="50" align="center">
                        <span class="badge">${topic.replynum}</span>
                    </td>
                </tr>
            </table>
        </div>
        </c:forEach>

        <div class="pagination pagination-mini pagination-centered">
            <ul id="pagination" style="margin-bottom:20px;"></ul>
        </div>
    </div>
    <!--box end-->
</div>

<script src="/static/js/jquery-1.11.3.min.js"></script>
<script src="/static/js/jquery.twbsPagination.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/user/notify.js"></script>

<script src="/static/jquery-jplayer/js/jquery.min.js"></script>
<script src='/static/jquery-jplayer/js/jquery.jplayer.min.js'></script>
<script src='/static/jquery-jplayer/js/jplayer.playlist.min.js'></script>
<script src="/static/jquery-jplayer/js/lanrenzhijia.js"></script>

<script>
    $(function(){
        $("#pagination").twbsPagination({
            totalPages:${page.totalPage},
            visiblePages:5,
            first:'首页',
            last:'末页',
            prev:'上一页',
            next:'下一页',
            href: '?p={{number}}&nodeid=${param.nodeid}'
        });
    });
</script>
</body>
</html>
