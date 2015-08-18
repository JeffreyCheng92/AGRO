class Api::ConsolesController < ApplicationController

  def show
    @console = Console.find(params[:id])

    if params[:letter]
      let = params[:letter].downcase
      # game_ids = GameConsole.where('console_id = ?', params[:id])
      #                        .pluck('game_id')
      # @games = []
      # game_ids.each do |game_id|
      #   game = Game.find(game_id)
      #   @games << game
      # end
      #
      # @games = @games.select { |game| !!(game.title.downcase =~ /^#{let}/) }

      @games =
        Game.joins(:game_consoles)
            .where("game_consoles.console_id = ? AND
                    LOWER(games.title) LIKE ?", params[:id], "#{let}%")


      @console.searched_games = @games
      @console.searched = true
    else
      @console.searched_games = [];
      @console.searched = false
    end
  end

end
