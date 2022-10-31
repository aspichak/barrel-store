class SessionsController < Devise::SessionsController
  def new
    render inertia: 'Login'
  end
end
