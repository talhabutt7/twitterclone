class CommentsController < ApplicationController

  def create
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comment = @tweeet.comments.create(params[:comment].permit(:name, :body))
    redirect_to tweeet_path(@tweeet)
  end

  def destroy
    @tweeet = Tweeet.find(params[:tweeet_id])
    @comment = @tweeet.comments.find(params[:id])
    @comment.destroy
    redirect_to tweeet_path(@tweeet)
  end


# end
