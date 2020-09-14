class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do 
    redirect_to main_app.root_path, notice: 'You have not permission to do this action'
  end
end
