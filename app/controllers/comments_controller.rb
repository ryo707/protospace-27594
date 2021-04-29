class CommentsController < ApplicationController
  def create
    if Comment.create(comment_params)
      redirect_to "/comments/#{comment.prototype.id}"
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
