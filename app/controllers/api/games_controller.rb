class Api::GamesController < ApplicationController

  def create
    @game = current_user.games.new(game_params)
    
    if @game.save
      render json: @game
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])

    if @game
      render :show
    else
      render json: @game, status: :unprocessable_entity
    end
  end

  private
  def game_params
    params.require(:game)
          .permit(:title, :description, :developer, :release_date, :rating)
  end

end
