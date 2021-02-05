require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael) # このコードは慣習的に正しくない
    @post = Post.new(  user_id: @user.id ,
                       name: "Lorem ipsum" ,
                       introduction: "Hello" ,
                       price: 30000 ,
                       adress: "東京都江戸川区",
                       image:  "no image" )
  end
  
  test "should be valid" do
    assert @post.valid?
  end
  
  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

end
