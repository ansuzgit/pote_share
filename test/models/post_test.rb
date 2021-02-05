require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @post = @user.posts.build(  user_id: @user.id ,
                       name: "Lorem ipsum" ,
                       introduction: "Hello" ,
                       price: 30000 ,
                       adress: "東京都江戸川区",
                       image:  open("#{Rails.root}/db/fixtures/default_icon.jpg")  )
  end
  
  test "should be valid" do
    assert @post.valid?
  end
  
  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
  
  test "name should be present" do
    @post.name = " "
    assert_not @post.valid?
  end
  
  test "introduction should be present" do
    @post.introduction = " " 
    assert_not @post.valid?
  end
  
  test "price should be present" do
    @post.price = " " 
    assert_not @post.valid?
  end

  test "adress should be present" do
    @post.adress = " " 
    assert_not @post.valid?
  end
  
  test "image should be present" do
    @post.image = " " 
    assert_not @post.valid?
  end
  
  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
  
end
