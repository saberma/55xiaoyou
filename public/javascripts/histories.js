var History = { 
  outer_tag: '__',
  inner_tag: '::',
  cookie_name: 'histories',
  max: 10,

  serial: function(array){
    return $.map(array,function(obj){
      return obj.join(History.inner_tag);
    }).join(History.outer_tag);
  },  

  deserial: function(string){
    if(string == null)
      return []; 
    return $.map(string.split(History.outer_tag),function(str){
      return [str.split(History.inner_tag)];
    }); 
  },  

  get: function(){
    return this.deserial($.cookies.get(this.cookie_name));
  },  

  set: function(array){
    $.cookies.set(this.cookie_name, this.serial(array));
  },  

  add: function(array){
    var histories = this.get();
    if(histories.length >= this.max){
      print('====');
      print(histories);
      histories.pop();
      print(histories);
      print('====');
    }
    histories.push(array); 
    this.set(histories);
  },

};

