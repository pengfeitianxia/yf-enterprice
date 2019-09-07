/**
 * Created by liqiang on 2016/4/6.
 */
/**
 * 在三方滚动插件基础上简单修改下（主题内容动态添加）
 */
(function($){
    $.fn.myScroll = function(options){
        var animateInterval=null;
        var animateIntervalRight=null;
        //默认配置
        var defaults = {
            speed:2000,  //多久请求一次数据
            rowHeight:72, //每行的高度
            time:300,//滚动的动画时间
            lastFadeoutTime:300,//内容最后一条消失的时间
            type:0,
            data:[]
        };
        var opts = $.extend({}, defaults, options),intId = [];
        function marquee(obj){
            //TODO 动态后台取数据，然后在回调中调用动画

            var dataType=opts.type;
            var dataObj=opts.data;

            $(obj).find('ul').prepend(dataObj.join(''));//动态添加需要添加的数据
            //将新添加的数据隐藏掉
            $(obj).find('ul').css("margin-top", -opts.rowHeight*dataObj.length+"px");

            //进入视野的和消失视野的的元素添加翻转动画
            function getUlTopNum(){
                var marginTop=$(obj).find('ul').css("margin-top").replace('px','')*1;
                //$(obj).find('ul').find('li').removeClass('box');

                var num=Math.ceil(-marginTop/opts.rowHeight);
                if(num>=1){
                    return num-1;
                }else{
                    return -1;
                }


            }
            if(dataType==1){//右侧
                window.clearInterval(animateIntervalRight);
                animateIntervalRight=setInterval(function () {
                    var num=getUlTopNum();
                    if(num>=0){
                        var curLi=$(obj).find('ul').find('li:eq('+num+')');
                        if(!curLi.hasClass('box')){
                            curLi.addClass('box').removeClass('box_init');
                            var curLi=$(obj).find('ul').find('li:eq('+(num+3)+')');
                            //可见的最后一个渐渐消失
                            if(curLi){
                                curLi.addClass('box_end').removeClass('box');
                                setTimeout(function () {
                                    curLi.remove();
                                },opts.lastFadeoutTime)
                            }
                        }
                    }
                },5);
            }else{
                window.clearInterval(animateInterval);
                animateInterval=setInterval(function () {
                    var num=getUlTopNum();
                    if(num>=0){
                        var curLi=$(obj).find('ul').find('li:eq('+num+')');
                        if(!curLi.hasClass('box')){
                            curLi.addClass('box').removeClass('box_init');
                            var curLi=$(obj).find('ul').find('li:eq('+(num+3)+')');
                            //可见的最后一个渐渐消失
                            if(curLi){
                                curLi.addClass('box_end').removeClass('box');
                                setTimeout(function () {
                                    curLi.remove();
                                },opts.lastFadeoutTime)
                            }
                        }
                    }
                },5);
            }

            obj.find("ul").animate({
                marginTop: '0'
            },opts.time);
        }

        this.each(function(i){
            var _this = $(this);
            marquee(_this);
        });
    }
})(jQuery);
