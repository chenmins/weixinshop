<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Grails"/>-${grails.util.Environment.current.name}</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <asset:stylesheet src="demos.css"/>
    <asset:javascript src="qiniu.min.js"/>

    <g:if test="${grails.util.Environment.current == grails.util.Environment.PRODUCTION}">
        <link rel="stylesheet" href="//cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
        <link rel="stylesheet" href="//cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
        <link rel="stylesheet" href="//at.alicdn.com/t/font_550516_ou4iw5zzs4hadcxr.css">
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="//cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
    </g:if>
    <g:if test="${grails.util.Environment.current == grails.util.Environment.DEVELOPMENT}">
        <asset:stylesheet src="weui.css"/>
        <asset:stylesheet src="jquery-weui.css"/>
        <asset:stylesheet src="iconfont.css"/>
        <asset:javascript src="jquery-2.1.4.js"/>
        <asset:javascript src="jquery-weui.js"/>
    </g:if>
    <g:layoutHead/>
</head>

<body ontouchstart="">

<g:layoutBody/>

</body>

</html>
