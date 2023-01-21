class TasksController < ApplicationController
    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :eyecatch)
    end
end