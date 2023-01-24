class Task < ApplicationRecord
    belongs_to :user
    belongs_to :board
    has_many :comments, dependent: :destroy
    has_one_attached :eyecatch
    validates :content, presence: true
end
