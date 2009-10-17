class HomeController < ApplicationController
  #caches_page :index

  def index
    @popular_list = Game.popular
    @now_list =  Rails.cache.fetch("now_list"){ Game.limit(5).popular }.take(4)
    @latest_list =  Game.limit(4)
  end
end
