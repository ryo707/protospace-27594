class Comment < ApplicationRecord
  belongs_to :prototypes
  belongs_to :users

  validates :text, presence: true
end
