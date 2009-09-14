# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :init_title

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def init_title
    @title = "小游网 | 在线小游戏,一个接一个,简单,好玩"
  end

end
