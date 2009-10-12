class HomeController < ApplicationController
  #caches_page :index

  def index
    @popular_list = Game.popular
    size = Game.all.size
    ids = []
    #todo:get random
    3.times do
      ids << (rand*size).ceil
    end
    @now_list = Game.find(ids)
  end
end
