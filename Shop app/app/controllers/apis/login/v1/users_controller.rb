class Apis::Login::V1::UsersController < ApplicationController
        def index
            @users = []
            User.all.each do |user|
                @users << get_formatted_user(user)
            end
            render json: @users
        end

        def new
          @user = User.new
        end

        def create
            @user =  User.new(user_params)

            byebug
      #     logger.debug @product.errors.full_messages
          if @user.save
            head 200 
          end

        end

        private 
        def get_formatted_user(user)
            formatted_user ={
                email: user.email,  
                password: user.encrypted_password,
            }     
      end
    
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
end