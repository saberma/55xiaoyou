# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

# Be sure to include AuthenticatedTestHelper in spec/spec_helper.rb instead.
# Then, you can remove it from this and the functional test.
include AuthenticatedTestHelper

describe User do

  describe 'being created' do
    before do
      @admin = Factory(:user)
    end

    it 'increments User#count' do
      lambda do
        user = Factory(:user, :login => '55xiaoyou')
        violated "#{user.errors.full_messages.to_sentence}" if user.new_record?
      end.should change(User, :count).by(1)
    end
  end

  #
  # Validations
  #

  it 'requires login' do
    lambda do
      u = User.create(:password => '55')
      u.errors.on(:login).should_not be_nil
    end.should_not change(User, :count)
  end

  it 'requires password' do
    lambda do
      u = User.create(:login => 'admin')
      u.errors.on(:password).should_not be_nil
    end.should_not change(User, :count)
  end
  #
  # Authentication
  #

  it 'authenticates user' do
    User.authenticate('admin', '55xiaoyou').should == @admin
  end

  it "doesn't authenticate user with bad password" do
    User.authenticate('admin', '55').should be_nil
  end
end
