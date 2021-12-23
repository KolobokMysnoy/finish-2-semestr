require "test_helper"

class IntTest < ActionDispatch::IntegrationTest
  setup do
    @user= User.create(username:"21", password:"21", password_confirmation:"21")
    post '/session/create', params: {username: "21", password: "21"}
  end  

  test "language" do
    # with russian language
    get root_url, params: {locale: 'ru'}
    assert_response :success

    # with english language
    get root_url, params: {locale: 'en'}
    assert_response :success
  end

  test 'go to root with login and without' do
    # with login
    get root_url
    assert_response :success

    # without
    get session_logout_url
    get root_url
    assert_redirected_to session_login_url
  end

  test "new user" do
    # create user
    user= User.new()
    post '/users', params: {user: {username: '22', password: '22', password_confirmation: '22'}}
    id=User.find_by(username: '22').id
    assert_redirected_to "/en/users/#{id}"

    # get root
    get root_url
    assert_response :success
  end

  test 'create post' do 
    # create post
    post= Post.new
    post '/posts', params: {post: { head:"Test head", body: "Test body"}}
    assert_not_nil Post.find_by(head:"Test head")

    # created by 
    assert_equal Post.find_by(head:"Test head").user.username, "21"
  end
end
