class Api::ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    if @image.save
      render json: @image
    else
      render json: @image.errors.full_messages, status: 422
    end
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors.full_messages, status: 422
    end
  end

  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  private
  def image_params
    params.require(:image)
          .permit(:url, :thumbnail_url, :imageable_id, :imageable_type)
  end
end
