require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      assigns[:popular_list].should_not be_nil
      assigns[:now_list].should_not be_nil
      response.should be_success
    end
  end
end
