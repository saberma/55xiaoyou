class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @title = "#{@game.name} | #{@title}"
  end
end
