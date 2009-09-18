require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GamesController do
  before(:each) do
    @game = Factory(:game)
    @attributes = Factory.attributes_for(:game)
  end

  it "should show game" do
    get :show, :id => @game.id
    assigns[:game].should_not be_nil
  end

  describe "admin logged in" do
    before(:each)do
      login_as :admin
    end

    it "should index game" do
      get :index
      assigns[:page].should_not be_nil
    end

    describe "add game" do
      it "should show new page" do
        get :new
        assigns[:game].should_not be_nil
      end

      it "should be success" do
        lambda do
          post :create, :game => @attributes
          assigns[:game].name.should_not be_nil
        end.should change(Game, :count).by(1)
      end
    end

    describe "edit game" do
      it "should show edit page" do
        get :edit, :id => @game.id
        assigns[:game].new_record?.should be_false
      end

      it "should be success" do
        lambda do
          post :update, :game => { :name => '新的' }, :id => @game.id
          assigns[:game].name.should == '新的'
        end.should_not change(Game, :count)
      end
    end
  end
end
