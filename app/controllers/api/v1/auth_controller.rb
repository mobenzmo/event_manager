module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authorize_request, only: [:login]

      def login
        user = User.find_by(email: params[:email])
        puts "USER: #{user.inspect}" # Debug line
        if user&.valid_password?(params[:password])
          token = encode_token({ user_id: user.id })
          render json: { user: user, token: token }
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end

      private

      def encode_token(payload)
        JWT.encode(payload, Rails.application.secret_key_base)

      end
    end
  end
end
