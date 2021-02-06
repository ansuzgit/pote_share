class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new,:create]
  
  def show
    
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  private
  
    def post_params
      params.require(:post).permit(:name, 
                                   :introduction, 
                                   :price,
                                   :adress,
                                   :image)
    end
    

  
end
