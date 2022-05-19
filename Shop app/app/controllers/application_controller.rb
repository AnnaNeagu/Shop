class ApplicationController < ActionController::Base
    include ApplicationHelper
    # skip_before_action :verify_authenticity_token
    # before_action :authenticate_user!
    protect_from_forgery prepend: true
end
