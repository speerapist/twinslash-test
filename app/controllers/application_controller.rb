class ApplicationController < ActionController::Base
  before_action :set_locale
  rescue_from CanCan::AccessDenied do 
    redirect_to main_app.root_path, notice: 'You have not permission to do this action'
  end

  def set_locale 
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    {locale: I18n.locale}.merge options
  end
end
