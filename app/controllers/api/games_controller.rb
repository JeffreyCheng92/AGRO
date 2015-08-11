class Api::GamesController < ApplicationController
  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  private
  def game_params
    params.require(:games)
          .permit(:title, :description, :developer, :release_date, :rating)
  end

end
