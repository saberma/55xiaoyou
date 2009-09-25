require("spec_helper.js");
require("../../public/javascripts/jquery.cookies.js");
require("../../public/javascripts/histories.js");
require("../../public/javascripts/games.js");

//init
MAX_GAME_ID = 1;
require("fixtures/histories.js");
History.add(first).add(second);

require("../../public/javascripts/application.js");

Screw.Unit(function(){
  describe("Your application javascript", function(){
    it("init next", function(){
      expect($('.next').attr('href')).to(equal, "/game/1");
    });

    it("show history", function(){
      expect($('#history li').length).to(equal, 2);
    });
  });
});

