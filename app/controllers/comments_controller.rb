class CommentsController < ApplicationController
  # http_basic_authenticate_with name: "larvata", password: "12345678", only: [:destroy]
  before_filter :authenticate_user!, :except => [:destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :content))

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

end
