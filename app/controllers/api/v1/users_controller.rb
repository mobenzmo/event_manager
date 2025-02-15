module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]
      skip_before_action :authorize_request, only: [:create]

      # GET /api/v1/users
      def index
        @users = User.all
        render json: @users
      end

      # GET /api/v1/users/:id
      def show
        if @user
          render json: @user
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PUT /api/v1/users/:id
      def update
        if @user
          if @user.update(user_params)
            render json: @user
          else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end

      # DELETE /api/v1/users/:id
      def destroy
        if @user
          @user.destroy
          head :no_content
        else
          render json: { error: "User not found" }, status: :not_found
        end
      end

      private

      def set_user
        @user = User.find_by(id: params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
