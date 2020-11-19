class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.tweeet_id = params[:tweeet_id]

    @comment.save

    redirect_to tweeet_path(@comment.tweeet)
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end



  # def create
  #   @tweeet = Tweeet.find(params[:tweeet_id])
  #   @comment = @tweeet.comments.create(params[:comment].permit(:name, :comment))
  #   redirect_to tweeet_path(@tweeet)
  # end
  #
  # def destroy
  #   @tweeet = Tweeet.find(params[:tweeet_id])
  #   @comment = @tweeet.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to tweeet_path(@tweeet)
  # end
end
