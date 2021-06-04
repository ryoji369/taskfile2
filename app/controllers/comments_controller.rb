class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
        redirect_to task_path(@comment.task)
    else
      @task = @comment.task
      @comments = @task.comments
      render "tasks/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, task_id: params[:task_id])
  end
end
