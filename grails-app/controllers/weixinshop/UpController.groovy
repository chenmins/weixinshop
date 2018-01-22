package weixinshop

import com.qiniu.util.Auth
import grails.converters.JSON

class UpController {

    def index() {

    }

    def json(){
        String accessKey = "_tHGHsfzctpubXOLyclhWWsMIVsN6TEBOTKVTYk1";
        String secretKey = "aMiNGaFW3tosNu5mi3hFSHDmar0yFV8JLaQxCBSI";
        String bucket = "blog";
        Auth auth = Auth.create(accessKey, secretKey);
        String upToken = auth.uploadToken(bucket);
        System.out.println(upToken);
        def map = ['uptoken':upToken]
        render  map as JSON
    }
}
