class HomeController < ApplicationController
  caches_page :index, :sitemap

  def sitemap
    @list = Game.all
  end
end
