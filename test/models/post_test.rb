require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "create post and delete post" do
    # We don't have a validates for posts
    # We can create two posts and save them
    # Post.create({"head"=>"sss", "body"=>"sss"}, user_id: 2)
    param= {head: "sss", body:"sss"}
    User.create(username: "us1",password: "us1")
    post = Post.create(**param,user_id: 1)
    post.save!
    post1=Post.new(**param,user_id: 1)
    assert_equal true, post1.save

    # # We can delete all posts
    Post.all.each do |el|
      el.destroy if el.head =="sss"
    end

    assert_nil Post.all.find_by(head: "sss")
  end
end
