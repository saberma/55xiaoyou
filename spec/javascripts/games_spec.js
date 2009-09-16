require("spec_helper.js");
require("../../public/javascripts/games.js");

Screw.Unit(function(){
  describe("Game", function(){
    it("should get random id", function(){
      expect(Game.randomId()).to(equal, "1");
    });

    it("should get next url", function(){
      expect(Game.next()).to(equal, "/games/1");
    });
  });
});
