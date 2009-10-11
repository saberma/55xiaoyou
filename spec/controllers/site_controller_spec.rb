require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SiteController do

  #Delete these examples and add some real ones
  it "should use SiteController" do
    controller.should be_an_instance_of(SiteController)
  end


  describe "GET 'aboutus'" do
    it "should be successful" do
      get 'aboutus'
      response.should be_success
    end
  end

  describe "GET 'contactus'" do
    it "should be successful" do
      get 'contactus'
      response.should be_success
    end
  end

  describe "GET 'disclaimer'" do
    it "should be successful" do
      get 'disclaimer'
      response.should be_success
    end
  end

  describe "GET 'partner'" do
    it "should be successful" do
      get 'partner'
      response.should be_success
    end
  end

  describe "GET 'map'" do
    it "should be successful" do
      Factory(:cat_and_dog)
      Factory(:gold)
      get 'map'
      assigns[:list].size.should == 2
      response.should be_success
    end
  end
end
