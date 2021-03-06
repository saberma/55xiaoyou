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
    @now_list =  Rails.cache.fetch("now_list"){ Game.limit(5).popular }
    unless @now_list.include?(@game)
      (@now_list += []).unshift(@game).pop
      Rails.cache.write("now_list", @now_list)
    end
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
      flash[:notice] = '新增成功!'
      expire_page :action => :max, :format => :js
    else
      flash[:error] = '新增出错!'
    end
    render :action => :new
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
