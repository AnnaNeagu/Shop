class ApplicationController < ActionController::Base
    include ApplicationHelper
    add_flash_types :info, :error, :success
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    # protect_from_forgery prepend: true
    # protect_from_forgery with: :null_session
    
end
