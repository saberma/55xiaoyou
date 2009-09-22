var Game = {

  nextUrl:function(){
    return "/game/" + this.randomId();
  },

  //range:[1,max_game_id]
  randomId:function(){
    return 1 + (Math.floor(Math.random() * MAX_GAME_ID));
  },

  next: function(){
    $('.next').attr('href', this.nextUrl());
  }

}
