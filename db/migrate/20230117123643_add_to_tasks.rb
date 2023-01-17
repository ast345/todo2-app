class AddToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :user
    add_reference :tasks, :board
  end
end
