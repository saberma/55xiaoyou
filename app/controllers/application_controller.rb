# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :init_title

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private
  def init_title
    @title = "小游网 | 这里有很多精选的小游戏"
  end

  def check_login
    unless logged_in?
      flash[:error] = "请先登录!"
      redirect_to home_path
    end
  end

end
