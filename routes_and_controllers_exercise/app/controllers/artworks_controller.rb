class ArtworksController < ApplicationController
  # def index
  #   artworks = Artwork.all
  #   render json: artworks
  # end

  def index
    user = User.find_by_id(params[:user_id])
    
    if user
      owned_artworks = Artwork.where(artist_id: user.id)
      shared_artworks = user.shared_artworks

      total_artworks = {owned: owned_artworks, shared: shared_artworks}

      render json: total_artworks
    else
      render json: "User not found.", status: 404
    end
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
        render json: artwork
    else
        render json: artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find_by_id(params[:id])
    
    if artwork.update(artwork_params)
        render json: artwork
    else
        render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find_by_id(params[:id]).destroy
    render json: artwork
  end

  def show
    artwork = Artwork.find_by_id(params[:id])
    if artwork.nil?
        render json: "This artwork doesn't exist.", status: 404
    else
        render json: artwork
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:image_url, :artist_id, :title)
  end  
end