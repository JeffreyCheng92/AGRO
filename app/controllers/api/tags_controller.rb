class Api::TagsController < ApplicationController

  def show
    @tag = Tag.includes(:games).find(params[:id])
  end
end
