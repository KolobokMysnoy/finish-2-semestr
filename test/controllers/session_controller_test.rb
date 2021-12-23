require "test_helper"

class SessionControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user= User.create(username:"21", password:"21", password_confirmation:"21")
    post '/session/create', params: {username: "21", password: "21"}
  end  

  test 'create' do
    # create session
    post '/session/create', params: {username: "21", password: "21"}
    assert_redirected_to root_url
  end 

  test 'logout' do
    get '/session/logout'
    assert_redirected_to session_login_url
  end
  
  # test "should get login" do
  #   get session_login_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get session_create_url
  #   assert_response :success
  # end

  # test "should get logout" do
  #   get session_logout_url
  #   assert_response :success
  # end
end
