class GamesController < ApplicationController
  before_filter :check_login, :except => :show

  def show
    @game = Game.find(params[:id])
    @title = "#{@game.name} | #{@title}"
  end
end
