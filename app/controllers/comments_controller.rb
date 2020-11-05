class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to "/posts/#{@comment.post.id}"
    else
      # render template: "/posts/#{@comment.post.id}"
      redirect_to "/posts/#{@comment.post.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end