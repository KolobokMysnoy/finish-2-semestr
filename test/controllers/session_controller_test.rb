# frozen_string_literal: true

require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: '21', password: '21', password_confirmation: '21')
    post '/session/create', params: { username: '21', password: '21' }
  end

  test 'login' do
    # get page
    get session_login_url
    assert_response :success
  end

  test 'create' do
    # create session (login)
    post '/session/create', params: { username: '21', password: '21' }
    assert_redirected_to root_url
  end

  test 'logout' do
    # can logout from session
    get '/session/logout'
    assert_redirected_to session_login_url
  end
end
