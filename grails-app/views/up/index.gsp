<!doctype html>
<html>
<head>
    <meta name="layout" content="jqui"/>
    <meta name="description" content="测试页面">
    <title>上传测试</title>
</head>
<body>
<div class="weui-tab">
    <div class="weui-tab__bd">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
            <h1>页面一</h1>
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <div class="weui-uploader">
                            <div class="weui-uploader__hd">
                                <p class="weui-uploader__title">图片上传</p>
                                <div class="weui-uploader__info">0/2</div>
                            </div>
                            <div class="weui-uploader__bd"   >
                                <ul class="weui-uploader__files" id="uploaderFiles">

                                </ul>
                                <div class="weui-uploader__input-box"   id="container">
                                    <input id="pickfiles" class="weui-uploader__input" type="button" >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="tab2" class="weui-tab__bd-item">
            <h1>页面二</h1>
        </div>
        <div id="tab3" class="weui-tab__bd-item">
            <h1>页面三</h1>
        </div>
        <div id="tab4" class="weui-tab__bd-item">
            <h1>页面四</h1>
        </div>
    </div>

    <div class="weui-tabbar">
        <a href="#tab1" class="weui-tabbar__item weui-bar__item--on">
            <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">8</span>
            <div class="weui-tabbar__icon">
                <i class="iconfont icon-all"></i>
            </div>
            <p class="weui-tabbar__label">打赏</p>
        </a>
        <a href="#tab2" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <i class="iconfont icon-video"></i>
            </div>
            <p class="weui-tabbar__label">资产</p>
        </a>
        <a href="#tab3" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <i class="iconfont icon-trade"></i>
            </div>
            <p class="weui-tabbar__label">账单</p>
        </a>
        <a href="#tab4" class="weui-tabbar__item">
            <div class="weui-tabbar__icon">
                <i class="iconfont icon-account"></i>
            </div>
            <p class="weui-tabbar__label">我</p>
        </a>
    </div>
</div>
<script>
    $(function(){
        initUploader();
    });

    function addFile(id) {
        var tmp = "<li id='li_"+id+"' class=\"weui-uploader__file weui-uploader__file_status\" style=\"background-image:url(${assetPath(src: 'pic_160.png')})\">";
        tmp += "<div id='file_"+id+"' class=\"weui-uploader__file-content\">0%</div></li>";
        var list = $('#uploaderFiles');
        list.append(tmp);
    }

    function okFile(id) {
        $('#li_'+id).remove();
        var tmp = "<li id='ok_"+id+"'  class=\"weui-uploader__file\" style=\"background-image:url( ${assetPath(src: 'pic_160.png')})\"></li>";
        var list = $('#uploaderFiles');
        list.append(tmp);
    }

    function process(id,n,info) {
        var file = $('#file_'+id);
        file.html(n+"% <br/>"+info);
    }

    function initUploader() {
        // $.alert("自定义的消息内容");
        var uploader = Qiniu.uploader({
            runtimes: 'html5,flash,html4',      // 上传模式，依次退化
            browse_button: 'pickfiles',         // 上传选择的点选按钮，必需
            // 在初始化时，uptoken，uptoken_url，uptoken_func三个参数中必须有一个被设置
            // 切如果提供了多个，其优先级为uptoken > uptoken_url > uptoken_func
            // 其中uptoken是直接提供上传凭证，uptoken_url是提供了获取上传凭证的地址，如果需要定制获取uptoken的过程则可以设置uptoken_func
            // uptoken : '<Your upload token>', // uptoken是上传凭证，由其他程序生成
            uptoken_url: '/up/json',         // Ajax请求uptoken的Url，强烈建议设置（服务端提供）
            // uptoken_func: function(){    // 在需要获取uptoken时，该方法会被调用
            //    // do something
            //    return uptoken;
            // },
            get_new_uptoken: true,             // 设置上传文件的时候是否每次都重新获取新的uptoken
            // downtoken_url: '/downtoken',
            // Ajax请求downToken的Url，私有空间时使用，JS-SDK将向该地址POST文件的key和domain，服务端返回的JSON必须包含url字段，url值为该文件的下载地址
            unique_names: true,              // 默认false，key为文件名。若开启该选项，JS-SDK会为每个文件自动生成key（文件名）
            // save_key: true,                  // 默认false。若在服务端生成uptoken的上传策略中指定了sava_key，则开启，SDK在前端将不对key进行任何处理
            domain: 'ohlo5qp57.qnssl.com',     // bucket域名，下载资源时用到，必需
            container: 'container',             // 上传区域DOM ID，默认是browser_button的父元素
            max_file_size: '100mb',             // 最大文件体积限制
            flash_swf_url: 'path/of/plupload/Moxie.swf',  //引入flash，相对路径
            max_retries: 3,                     // 上传失败最大重试次数
            dragdrop: true,                     // 开启可拖曳上传
            drop_element: 'container',          // 拖曳上传区域元素的ID，拖曳文件或文件夹后可触发上传
            chunk_size: '4mb',                  // 分块上传时，每块的体积
            auto_start: true,                   // 选择文件后自动上传，若关闭需要自己绑定事件触发上传
            //x_vars : {
            //    查看自定义变量
            //    'time' : function(up,file) {
            //        var time = (new Date()).getTime();
            // do something with 'time'
            //        return time;
            //    },
            //    'size' : function(up,file) {
            //        var size = file.size;
            // do something with 'size'
            //        return size;
            //    }
            //},
            init: {
                'FilesAdded': function(up, files) {
                    plupload.each(files, function(file) {
                        // 文件添加进队列后，处理相关的事情
                    });
                },
                'BeforeUpload': function(up, file) {
                    // 每个文件上传前，处理相关的事情
                    // file.id
                    // file.name
                    addFile(file.id)
                },
                'UploadProgress': function(up, file) {
                    // 每个文件上传时，处理相关的事情
                    // var info =(returnFloat(file.speed/ 1024)+ 'KB/s ' + returnFloat((file.loaded / 1024/ 1024))+"MB/"+returnFloat((file.size / 1024/ 1024)) +"MB");
                    var info =(returnFloat(file.speed/ 1024)+ 'KB/s ');
                    process(file.id,file.percent,info);
                },
                'FileUploaded': function(up, file, info) {
                    // 每个文件上传成功后，处理相关的事情
                    // 其中info.response是文件上传成功后，服务端返回的json，形式如：
                    // {
                    //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
                    //    "key": "gogopher.jpg"
                    //  }
                    // 查看简单反馈
                    var domain = up.getOption('domain');
                    var res = $.parseJSON(info.response);
                    var sourceLink = "http://"+domain +"/"+ res.key; //获取上传成功后的文件的Url
                    var a='<a href="'+sourceLink+'" target="_blank">'+sourceLink+'</a>';
                    $.alert("自定义的消息内容"+a);
                    // if(checkEnd(res.key,".jpg")||checkEnd(res.key,".png")||checkEnd(res.key,".gif")||checkEnd(res.key,".jpeg")){
                    //     addHTML("<img src='"+sourceLink+"' width='400'/>")
                    // }
                    // addHTML(a)
                    process(file.id,100)
                    okFile(file.id)
                },
                'Error': function(up, err, errTip) {
                    //上传出错时，处理相关的事情
                },
                'UploadComplete': function() {
                    //队列文件处理完毕后，处理相关的事情
                },
                'Key': function(up, file) {
                    // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
                    // 该配置必须要在unique_names: false，save_key: false时才生效
                    var key = "";
                    // do something with key here
                    return key
                }
            }
        });
    }

    function checkEnd(str,end){
        var pos = str.lastIndexOf(end);
        if(pos === -1){
            return false;
        }else{
            return pos + end.length === str.length;
        }
    }
    function returnFloat(value){
        return Math.round(value);
        // var value=Math.round(parseFloat(value)*100)/100;
        // var xsd=value.toString().split(".");
        // if(xsd.length==1){
        //     value=value.toString()+".00";
        //     return value;
        // }
        // if(xsd.length>1){
        //     if(xsd[1].length<2){
        //         value=value.toString()+"0";
        //     }
        //     return value;
        // }
    }
</script>
    </body>
</html>
