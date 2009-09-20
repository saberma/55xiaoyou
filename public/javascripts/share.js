//收藏分享
var Share = {

  douban: function(url,title){
    alert('in');
    var u='http://www.douban.com/recommend/?url='+url+'&title='+encodeURIComponent(title);
    window.open(u,'douban','toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=330');
    void(0);
  },

  yahoo: function(url,title){
    var u='http://myweb.cn.yahoo.com/popadd.html?url='+url+'&title='+encodeURIComponent(title);
    window.open(u,'yahoo','toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=430');
    void(0);
  },

  baidu: function(url,title){
    var u='http://cang.baidu.com/do/add?iu='+encodeURIComponent(url)+'&it='+encodeURIComponent(title) + '&dc=&fr=ien#nw=1';
    window.open(u,'baidu','toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=430');
    void(0);
  },

  qq: function(url,title){
    var u='http://shuqian.qq.com/post?from=3&jumpback=2&noui=1&uri='+url+'&title='+encodeURIComponent(title);
    window.open(u,'qq','toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=430');
    void(0);
  },

  xiaonei: function(url,title){
    var u='http://share.xiaonei.com/share/buttonshare.do?link='+url+'&title='+encodeURIComponent(title);
    window.open(u,'xiaonei','toolbar=0,resizable=1,scrollbars=yes,status=1,width=450,height=430');
    void(0);
  }

}
