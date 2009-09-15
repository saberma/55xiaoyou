require("spec_helper.js");
require("../../public/javascripts/games.js");

Screw.Unit(function(){
  describe("Games", function(){
    it("should get random id", function(){
      expect(Games.randomId()).to(equal, "1");
    });

    it("should get next url", function(){
      expect(Games.next()).to(equal, "/games/1");
    });

    it("should show history"), function(){
      var history_json = {};
      expect(Games.history()).to(equal, history_json);
    });
  });
});
