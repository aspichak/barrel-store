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

  def request_authenticity_tokens
    super << request.headers['HTTP_X_XSRF_TOKEN']
  end
end
