class ImagesController < ApplicationController
  def index
    @images = Image.all
    render json: @images
  end

  def show
    @image = Image.find(params[:id])
    tags = @image.tags.pluck(:name)
    render json: {image: @image, user: @image.user, tags: tags}.as_json
  end
end
