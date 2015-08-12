class Api::ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    if image.save
      render json: @image
    else
      render json: {message: 'failure'}, status: 422
    end
  end

  def update
    # image = 
  end

  def show
    @image = Image.find(params[:id])
    render json: @image
  end

  private
  def image_params
    params.require(:image).permit(:url, :thumb_url)
  end
end
