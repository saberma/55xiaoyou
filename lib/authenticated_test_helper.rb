module AuthenticatedTestHelper
  # Sets the current user in the session from the user fixtures.
  def login_as(user)
    @request.session[:user_id] = user ? (user.is_a?(User) ? user.id : User.find_by_login(user.to_s).id) : nil
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(User.find_by_login(user.to_s).login, 'monkey') : nil
  end
  
  # rspec
  def mock_user
    user = mock_model(User, :id => 1,
      :login  => 'user_name',
      :name   => 'U. Surname',
      :to_xml => "User-in-XML", :to_json => "User-in-JSON", 
      :errors => [])
    user
  end  
end
