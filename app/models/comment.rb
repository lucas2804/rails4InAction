class Comment < ActiveRecord::Base
  delegate :project, to: :ticket
  validates :text, presence: true
  belongs_to :author, class_name: "User"
end
