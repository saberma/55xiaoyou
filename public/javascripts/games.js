MAX_GAME_ID = 1;

var Games = {
  next:function(){
    return "/games/" + this.randomId();
  },

  //range:[1,max_game_id]
  randomId:function(){
    return 1 + (Math.floor(Math.random() * MAX_GAME_ID));
  }
}
