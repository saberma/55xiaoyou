class GamesController < ApplicationController
  before_filter :check_login, :except => :show

  def index
    @page  = Game.paginate :page => params[:page]
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
    render :action => :new
  end

  def create
    @game = Game.create(
      params[:game].merge(
        :creator => current_user,
        :modifier => current_user
      )
    )
    if @game.errors.empty?
      flash[:notice] = '新增成功!可以继续新增!'
      redirect_to new_game_path
    else
      flash[:error] = '新增出错!'
      render :action => :new
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])
      flash[:notice] = '修改成功!'
      redirect_to games_path
    else
      flash[:error] = '修改出错!'
      render :action => :new
    end
  end
end
