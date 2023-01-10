class BoardsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

def new
    @board = current_user.boards.build
end

def create
	@board = Board.new(board_params)
	if @board.save
        redirect_to board_path(@board)
    end
end

private
def board_params
    params.require(:board).permit(:name, :description)
end

end