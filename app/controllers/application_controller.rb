class ApplicationController < ActionController::Base
  before_action do
    cookies['XSRF-TOKEN'] = { value: form_authenticity_token, same_site: 'Strict' }
  end

  inertia_share user: -> {
    {
      id: current_user&.id,
      email: current_user&.email
    }
  }

  inertia_share flash: -> {
    {
      notice: flash.notice,
      alert: flash.alert
    }
  }

  rescue_from ActionController::InvalidAuthenticityToken do
    redirect_back fallback_location: '/', notice: 'The page expired, please try again.'
  end

  protected

  def after_sign_in_path_for(resource)
    barrel_index_path
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path
    end
  end

  def request_authenticity_tokens
    super << request.headers['HTTP_X_XSRF_TOKEN']
  end
end
