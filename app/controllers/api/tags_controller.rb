class Api::TagsController < ApplicationController

  def index
    if params[:query]
      query = params[:query].gsub("+", " ").downcase
      @tags = Tag.where("LOWER(label) LIKE ?", "%#{query}%").order(:label)
    else
      @tags = Tag.all
    end
  end

  def show
    @tag = Tag.includes(:games).find(params[:id])
  end
end
