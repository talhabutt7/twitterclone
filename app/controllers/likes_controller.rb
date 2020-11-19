class LikesController < ApplicationController
  before_action :find_tweeet
  before_action :find_like, only: [:destroy]



  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @tweeet.likes.create(user_id: current_user.id)
    end
    redirect_to root_path(@tweeet)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to root_path(@tweeet)
  end

  def find_like
    @like = @tweeet.likes.find(params[:id])
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, tweeet_id:
        params[:tweeet_id]).exists?
  end

  def find_tweeet
    @tweeet = Tweeet.find(params[:tweeet_id])
  end


end
