class ApplicationController < ActionController::Base

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  after_action :verify_authorized, except: [:index],
               unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index],
               unless: :devise_controller?

  before_action :set_i18n_locale_from_params
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:signin) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end


  private

  def not_authorized
    redirect_to root_path, alert: "You aren't allowed to do that."
  end
end
