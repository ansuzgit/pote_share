class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new,:create,:my_index,:show]
  
  def index
    @posts = Post.search_area(params[:area]).search_keyword(params[:keyword])
  end
  
  def my_index
    @posts = current_user.posts
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "ルーム登録に成功しました"
      redirect_to post_path(@post) 
    else
      flash.now[:danger] = 'ルーム登録に失敗しました。'
      render new_post_path
    end
  end

  private
  
    def post_params
      params.require(:post).permit(:name, 
                                   :introduction, 
                                   :price,
                                   :adress,
                                   :image,
                                   :id
                                   )
                                   .merge(user_id: current_user.id)
                                   
    end
    
end
