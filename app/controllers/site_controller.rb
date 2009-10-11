class SiteController < ApplicationController
  caches_page :aboutus, :contactus, :disclaimer, :partner, :sitemap

  def aboutus
  end

  def contactus
  end

  def disclaimer
  end

  def partner
  end

  def map
    @list = Game.all
  end

end
