class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :provider, class_name: "User"
end
