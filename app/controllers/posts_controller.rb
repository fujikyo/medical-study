class PostsController < ApplicationController
  before_action :before_post, only:  [:show,:destroy,:edit,:update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to :root
    else
      render "new"
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comment.includes(:user)
  end

  def destroy
    @post.destroy
  end

  def edit
  end

  def update
    @post.update(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title,:detail,:image).merge(user_id: current_user.id)
  end

  def before_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
