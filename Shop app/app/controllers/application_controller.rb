class ApplicationController < ActionController::Base
    include ApplicationHelper
      # protect_from_forgery with: :null_session
    add_flash_types :info, :error, :success

    #commented for vue access
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!

    #uncommented for vue access
    protect_from_forgery prepend: true
    
end
