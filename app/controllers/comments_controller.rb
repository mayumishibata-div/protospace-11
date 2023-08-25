class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
    else 
      @comments = @prototype.comments.includes(:user)
      render "tweets/show", status: :unprocessable_entity
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
