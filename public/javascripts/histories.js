$.cookies.setOptions({hoursToLive: 32767});

var History = { 

  outer_tag: '__',
  inner_tag: '::',
  cookie_name: 'histories',
  max: 8,

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
    if(histories.length != 0){
      var histories_id = $.map(histories, function(n){ return n[0] });
      if($.inArray(array[0], histories_id)>=0){
        return this;
      }
    }
    if(histories.length >= this.max){
      histories.pop();
    }
    histories.unshift(array); 
    this.set(histories);
    return this;
  }

};

