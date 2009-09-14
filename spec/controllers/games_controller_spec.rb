require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GamesController do
  before(:each) do
    @game = Factory(:game)
  end

  it "should show game" do
    get :show, :id => @game.id
    assigns[:game].should_not be_nil
  end
end
