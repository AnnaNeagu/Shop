class Apis::Login::V1::LoginController < ApplicationController
    def index
      @users = []
      User.all.each do |user|
          @users << get_formatted_user(user)
      end
      byebug
      render json: @users
      end
  
      def new
        @user = User.new
      end
  
    #   def create
    #     # byebug
    #     @product =  Product.new(product_params)
    #     logger.debug @product.errors.full_messages
    #     if @product.save
    #       head 200 
    #     end
    #   end
  
    #   def edit
    #     @product =  Product.find(params[:id])
    #   end
    
    #   def update
    #     @product =  Product.find(params[:id])
    
    #     if @product.update(product_params)
    #       head 200
    #     end
    #   end
  
    #   def destroy
    #     @product =  Product.find(params[:id])
    #     @product.destroy
    #     if @product.destroyed?
    #       head 200
    #     end
    #   end
      
  
      private 
      def get_formatted_user(user)
          formatted_user ={
              email: user.email,  
              password: user.encrypted_password,
          }     
    end
  
    def user_params
      params.require(:user).permit(:email, :encrypted_password)
    end
  end