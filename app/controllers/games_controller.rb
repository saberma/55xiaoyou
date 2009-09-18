class GamesController < ApplicationController
  before_filter :check_login, :except => :show

  def index
    Game.paginate :page => params[:page]
  end

  def show
    @game = Game.find(params[:id])
    @title = "#{@game.name} | #{@title}"
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.create(params[:game])
    if @game.errors.empty?
      flash[:notice] = '新增成功!'
      redirect_to edit_game_path(@game)
    else
      flash[:error] = '新增出错!'
      render :action => :new
    end
  end

  def update
    @game = Game.find(params[:game])
    if @game.update_attributes(params[:game])
      flash[:notice] = '更新成功!'
      redirect_to edit_game_path(@game)
    else
      flash[:error] = '更新出错!'
      render :action => :edit
    end
  end
end
