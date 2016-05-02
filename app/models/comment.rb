class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :ticket
  delegate :project, to: :ticket


  scope :persisted, lambda { where.not(id: nil) }


  validates :text, presence: true
end
