require("spec_helper.js");
require("../../public/javascripts/jquery.cookies.js");
require("../../public/javascripts/histories.js");
require("fixtures/histories.js");

Screw.Unit(function(){

  describe("History", function(){
    before(function(){ document.cookie = ''; });

    //空
    it("should empty", function(){
      expect(History.get()).to(equal, []);
    });

    //加一条记录
    it("should add record", function(){
      History.add(first);
      expect(History.get()).to(equal, [first]);
      History.add(second);
      expect(History.get()).to(equal, [second, first]);
    });

    //重复记录不增加
    it("should not add duplicate record", function(){
      History.add(first).add(first)
      expect(History.get()).to(equal, [first]);
    });

    //只保存max数量的记录
    it("should remove lastest", function(){
      History.max = 1;
      History.add(first);
      History.add(second);
      expect(History.get()).to(equal, [second]);
    });
  });
});
