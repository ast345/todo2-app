class BoardsController < ApplicationController
    before_action :set_board, only: [:show, :edit, :update]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @boards =Board.all
    end

    def new
        @board = current_user.boards.build
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to board_path(@board)
        end
    end

    def edit
        @board = Board.find(params[:id])
    end

    def update
        if @board.update(board_params)
            redirect_to boards_path, notice: '更新できました'
        else
            flash.now[:error] = '更新に失敗しました'
            render :edit
        end
    end

    def set_board
        @board = Board.find(params[:id])
    end

    private
    def board_params
        params.require(:board).permit(:name, :description)
    end

end