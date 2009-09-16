// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){

  //init next button
  Game.next();

  //add history
  if(typeof(game_id) != 'undefined')
    History.add([game_id, game_name]);

  //init history
  $.each(History.get(), function(i, n){
    var id = n[0];
    var name = n[1];
    li = $('<li/>').appendTo($('#history'));
    $('<a/>').html(name).attr('href', '/games/' + id).appendTo(li);
  });
});
