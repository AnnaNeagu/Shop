class ApplicationController < ActionController::Base
    include ApplicationHelper
    skip_before_action :verify_authenticity_token
    # protect_from_forgery with: :null_session
end
