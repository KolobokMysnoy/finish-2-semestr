# frozen_string_literal: true

require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  include SessionHelper

  setup do
    @user = User.create(username: '21', password: '21', password_confirmation: '21')
    post '/session/create', params: { username: '21', password: '21' }
  end

  test 'should get view' do
    # Get view
    # view is root
    get root_url
    assert_response :success
  end

  test 'parse' do
    # test for parse input params
    get '/en/show/', params: { what_to_show: 'false' }
    assert_equal 'false', assigns(:what_to_show)
  end

  test 'what to answer' do
    # if user doesn't have a post then result is NilClass
    get '/en/show/', params: { what_to_show: 'true' }
    assert_equal NilClass, assigns(:posts_to_show).first.class

    # if user has a post then result is Post
    post posts_url, params: { post: { body: '44', head: '55' } }
    get '/en/show/', params: { what_to_show: 'true' }

    # show return a hash
    assert_instance_of Hash, assigns(:posts_to_show).first
    Post.find_by(head: '55').destroy
  end

  # show test is selenium
end
