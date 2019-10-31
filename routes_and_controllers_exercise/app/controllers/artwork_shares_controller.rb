class ArtworkSharesController < ApplicationController
    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        
        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: 422
        end
    end

    def destroy
        destroyed_share = ArtworkShare.find_by_id(params[:id]).destroy

        render json: destroyed_share
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end
end