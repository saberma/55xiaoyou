require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Game do
  before(:each) do
    admin = Factory(:user)
    @valid_attributes = {
      :name => "猫狗大战",
      :description => "经典小游戏",
      :url => "test.swf",
      :creator => admin,
      :modifier => admin
    }
  end

  it "should create a new instance given valid attributes" do
    Game.create!(@valid_attributes)
  end
end
