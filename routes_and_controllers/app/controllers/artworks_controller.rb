class ArtworksController < ApplicationController 

   def index
    artworks = User.find(params[:user_id]).artworks
    artworks += User.find(params[:user_id]).shared_artworks

    render json: artworks
   
   end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end


  def show
    artwork = Artwork.where(id: params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :not_found
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    artwork = Artwork.find(params[:id])

    if artwork.delete 
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: :forbidden
    end
  end


   private 
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end