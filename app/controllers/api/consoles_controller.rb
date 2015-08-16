class Api::ConsolesController < ApplicationController
  def show
    if params[:letter]
      let = params[:letter].downcase
      game_ids = GameConsole.where('console_id = ?', params[:id])
                             .pluck('game_id')
      @games = []
      game_ids.each do |game_id|
        game = Game.find(game_id)
        @games << game
      end

      @games = @games.select { |game| !!(game.title.downcase =~ /^#{let}/) }

      @console = Console.find(params[:id])
      @console.searched_games = @games
      @console.searched = true
    else
      @console = Console.find(params[:id])
      @console.searched_games = [];
      @console.searched = false
    end
  end

end
