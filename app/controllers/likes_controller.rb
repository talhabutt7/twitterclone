class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else

      @tweeet.likes.create(user_id: current_user.id)
    end
    redirect_to tweeet_path(@tweeet)
    # @post.likes.create(user_id: current_user.id)
    # redirect_to post_path(@post)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@tweeet)
  end

  def find_like
    @like = @tweeet.likes.find(params[:id])
  end

  private

  def find_post
    @tweeet = Tweeet.find(params[:tweeet_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, tweeet_id: params[:post_id]).exists?
  end
end
