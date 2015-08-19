class Api::ConsolesController < ApplicationController

  def show
    @console = Console.find(params[:id])

    if params[:letter]
      let = params[:letter].downcase

      @games =
        Game.joins(:game_consoles)
            .where("game_consoles.console_id = ? AND
                    LOWER(games.title) LIKE ?", params[:id], "#{let}%")
            .order(:title)

      @console.searched_games = @games
      @console.searched = true
    else
      @console.searched_games = [];
      @console.searched = false
    end
  end

end
