class UsersController < ApplicationController
    def index
        name = params[:query]
        if name
            users = User.where("username ILIKE '%#{name}%'")
            render json: users
        else
            users = User.all
            render json: users
        end
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def update
        user = User.find_by_id(params[:id])
        
        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find_by_id(params[:id]).destroy
        render json: user
    end

    def show
        user = User.find_by_id(params[:id])
        if user.nil?
            render json: "This user doesn't exist.", status: 404
        else
            render json: user
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end