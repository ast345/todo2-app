class CommentsController < ApplicationController
    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        task = Task.find(params[:task_id])
        @comment = current_user.comments.new(comment_params)
        @comment.task_id = task.id
        if @comment.save
            redirect_to board_task_path(task.board_id, task), notice: 'コメントを追加'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    private
    def comment_params
	    params.require(:comment).permit(:content)
    end
end