class PostsController < ApplicationController
  before_action :before_post, only:  [:show,:destroy,:edit,:update]
  before_action :move_to_index, except: [:index, :show, :serch]

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
    if @post.destroy
      redirect_to :root
    else
      redirect_to item_path(@post.id)
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      redirect_to edit_post_path(@post.id)
    end
  end

  def search
    @posts = Post.search(params[:keyword])
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
