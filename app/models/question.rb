class Question < ApplicationRecord
  validates :title, presence: true

  belongs_to :asker, class_name: "User"
  has_many :answers

  scope :is_public, -> { where(is_private: false)}
end
