/**
 * Created by jing.li on 2015/12/15.
 */
console.log("------------------------");
function FlashCallJs(mode,id,swfUrl,w,h){
    var params = {
        menu: "false",
        scale: "noScale",
        allowFullscreen: "true",
        allowScriptAccess: "always",
        bgcolor: "#000",
        wmode: mode
    };
    var attributes = {
        id:id
    };
    swfobject.embedSWF(
        swfUrl,
        "altContent", w, h, "10.0.0",
        "expressInstall.swf",
         params, attributes);
    /*if(id=="vod")
    {
        fun();
        id.callAsMain(url);
        id.callAsFunction(url);
    }
    else
    {
        id.callAsFunction(url);
    }*/

}

FlashCallJs.prototype = {
    constructor : FlashCallJs,
    sendHtml : function(strUrl,fun){
        fun();
    },
    sendToJavaScript : function(id,fun){
        fun();
    }
}
