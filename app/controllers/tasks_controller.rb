class TasksController < ApplicationController
    def index
        # board = Board.find(params[:board_id])
        @task =Task.all
        # @task.board_id = board.id
    end

    def new
        board = Board.find(params[:board_id])
        @task = current_user.tasks.build
        @task.board_id = board.id
    end

    def create
        board = Board.find(params[:board_id])
        @task = current_user.tasks.new(task_params)
        @task.board_id = board.id
        if @task.save
            redirect_to board_tasks_path(board), notice: 'コメントを追加'
        else
            flash.now[:error] = '保存できませんでした'
            render :new
        end
    end

    def show
        @task = Task.find(params[:id])
        @comments = @task.comments
    end

    def edit
        @task = Task.find(params[:id])
    end

    def destroy
        task = Task.find(params[:id])
        task.destroy!
        redirect_to boards_path, notice: '記事が削除できました'
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :eyecatch, :id)
    end
end