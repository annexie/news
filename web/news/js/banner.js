// 焦点图片淡隐淡现
$("#slide").Xslider({
  affect: 'fade',
  ctag: 'li', //内容标签 默认为<a>
  speed: 800, //动画速度
  space: 4000, //时间间隔
  auto: true, //自动滚动
  trigger: 'mouseover', //触发事件 注意用mouseover代替hover
  conbox: '.conbox', //内容容器id或class
  switcher: '.switcher', //切换触发器id或class
  stag: 'a', //切换器标签 默认为a
  current: 'cur', //当前切换器样式名称
  rand: false //是否随机指定默认幻灯图片
});


//统计代码
$(document).delegate('a', 'click', function (ev) {

  var target = ev.target, $target = $(target);
  var action, info, url;

  info = encodeURIComponent($target.attr('title'));
  url = encodeURIComponent($target.attr('href'));

});