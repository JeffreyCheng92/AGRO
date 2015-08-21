class Api::GamesController < ApplicationController

  def create
    @game = current_user.games.new(game_params)
    @game.console_ids = params[:console_ids]

    tag_ids = [];
    params[:tags].split(", ").each do |tag|
      tag_obj = Tag.findOrCreateByLabel(tag)
      tag_ids << tag_obj.id if (tag_obj.id && !tag_ids.include?(tag_obj.id))
    end

    @game.tag_ids = tag_ids

    if @game.save
      render 'show'
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.console_ids = params[:console_ids]

    tag_ids = [];
    params[:tags].split(", ").each do |tag|
      tag_obj = Tag.findOrCreateByLabel(tag)
      tag_ids << tag_obj.id if (tag_obj.id && !tag_ids.include?(tag_obj.id))
    end

    @game.tag_ids = tag_ids

    if @game.update(game_params)
      render 'show'
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    if params[:query]
      query = params[:query].gsub("+", " ").downcase
      @games = Game.select("title, id")
                   .where("LOWER(title) LIKE ?", "%#{query}%").order(:title)
      render 'navsearch'
    else
      sleep(1)
      if params[:letter]
        let = params[:letter]
        @games = Game.where("LOWER(title) LIKE ?", "#{let.downcase}%")
                     .order(:title)
      elsif params[:top]
        @games = Game.includes(:cover).find_by_sql("
          SELECT
            games.*
          FROM
            games
          JOIN
            reviews ON games.id = reviews.game_id
          GROUP BY
            games.id
          ORDER BY
            AVG(reviews.rating) DESC
          LIMIT
            8"
        )
      elsif params[:console]
        @games = Game.includes(:cover).find_by_sql(
        ["
          SELECT
            games.*
          FROM
            games
          JOIN
            reviews ON games.id = reviews.game_id
          JOIN
            game_consoles ON games.id = game_consoles.game_id
          WHERE
            game_consoles.console_id = ?
          GROUP BY
            games.id
          ORDER BY
            AVG(reviews.rating) DESC
          LIMIT
            8",
        params[:console]])
      else
        @games = Game.all.order(:title)
      end
    end
  end

  def show
    @game = Game.includes(:reviews).find(params[:id])

    if @game
      render :show
    else
      render json: @game, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])

    if current_user.nil?
      flash[:errors] = "You must log in as the author to delete games."
      render json: flash[:errors]
    elsif @game.author_id == current_user.id
      @game.destroy()
      render json: @game
    else
      flash.now[:errors] = "Must be logged in to do that"
      render json: @game
    end
  end

  private
  def game_params
    params.require(:game)
          .permit(:title, :description, :developer,
                  :release_date, :rating)
  end

end
