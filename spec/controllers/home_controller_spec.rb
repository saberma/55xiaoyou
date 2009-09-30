require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HomeController do
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'sitemap'" do
    it "should be successful" do
      Factory(:cat_and_dog)
      Factory(:gold)
      get 'sitemap'
      assigns[:list].size.should == 2
      response.should be_success
    end
  end
end
