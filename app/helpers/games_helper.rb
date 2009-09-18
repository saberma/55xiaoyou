module GamesHelper
  def show_page(game)
    { :action => 'show', :id => game.id }
  end
end
