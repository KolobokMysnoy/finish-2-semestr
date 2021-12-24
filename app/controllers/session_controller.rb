# frozen_string_literal: true

class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[login create]
  def login; end

  def create
    user1 = User.find_by(username: params[:username])

    if user1&.authenticate(params[:password])
      p 'Login'
      sign_in user1
      redirect_to root_url
    else
      p 'Redirect'
      redirect_to session_login_url
    end
  end

  def logout
    sign_out
    redirect_to session_login_url
  end
end
