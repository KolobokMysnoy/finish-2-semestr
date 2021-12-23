require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  include SessionHelper

  setup do
    @user= User.create(username:"21", password:"21", password_confirmation:"21")
    post '/session/create', params: {username: "21", password: "21"}
  end  


  test "should get view" do
    # Get view 
    get root_url
    assert_response :success
  end
  
  test "parse" do
    get '/en/show/', params: {what_to_show: "false"}
    assert_equal 'false', assigns(:what_to_show)
  end

  test "what to answer" do 
    get '/en/show/', params: {what_to_show: "false"}
    assert_equal NilClass,assigns(:posts_to_show).first.class
  end
end
