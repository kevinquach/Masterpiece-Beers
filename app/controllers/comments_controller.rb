class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @beer_label = BeerLabel.find_by_url(params[:beer_label_id])
    @beer_label.user = current_user
    @comment = @beer_label.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment successfully added."
      redirect_to beer_label_path(@beer_label)
    else
      flash[:notice] = "Comment did not save."
      redirect_to beer_label_path(@beer_label)
    end
  end

  def destroy
    @beer_label = BeerLabel.find_by_url(params[:beer_label_id])
    @comment = @beer_label.comments.find(params[:id])
    @comment.destroy
    redirect_to beer_label_path(@beer_label)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_comment)
  end

end
