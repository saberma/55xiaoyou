class GamesController < ApplicationController
  before_filter :check_login, :except => [:show, :max]
  caches_page :max
  #caches_page :show

  def index
    @page  = Game.paginate :page => params[:page]
  end

  def max
    @max_game_id  = Game.maximum(:id)
    render :layout => false
  end

  def show
    @game = Game.find(params[:id])
    @game.increment! :views
    size = Game.all.size
    ids = []
    #todo:get random
    3.times do
      ids << (rand*size).ceil
    end
    @now_list = Game.find(ids)
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
      expire_page :action => :max, :format => :js
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
      expire_page :action => :show, :id => @game.id
    else
      flash[:error] = '修改出错!'
      render :action => :new
    end
  end
end
