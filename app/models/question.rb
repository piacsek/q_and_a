class Question < ApplicationRecord
  belongs_to :asker, class_name: "User"
end
