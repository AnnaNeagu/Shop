class Apis::Products::V1::CheckSessionsController < ApplicationController
    def index
      @session_current = []
      CheckSession.all.each do |session|
          @session_current << get_formatted_session(session)
      end
      
      render json: @session_current
    end

      def new
        @session_current = CheckSession.new
      end
  
      def create
        
        @session_current =  CheckSession.new(session_params)
        # logger.debug @product.errors.full_messages
        
        if @session_current.save
          head 200 
        end
      end
  
      # def edit
      #   byebug
      #   @session_current =  CheckSession.find(params[:id])
      # end
    
      def update
       
        @session_current =  CheckSession.find(params[:id])
        
        if @session_current.update(session_params)
          head 200
        end
      end
  
      def destroy
        @session_current =  CheckSession.find(params[:id])
        @session_current.destroy
        if @session_current.destroyed?
          head 200
        end
      end
      
  
      private 
      def get_formatted_session(session)
          formatted_session ={
              id: session.id,
              value: session.value,
          }     
    end
  
    def session_params
      params.require(:check_session).permit(:value)
    end
  end