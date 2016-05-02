class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :ticket
  delegate :project, to: :ticket

  # Important ref state               -> state_id
  #           ref previous_state_id   -> previous_state_id
  belongs_to :state
  belongs_to :previous_state, class_name: "State"


  before_create :set_previous_state
  after_create :set_ticket_state


  scope :persisted, lambda { where.not(id: nil) }


  validates :text, presence: true


  private
  def set_ticket_state
    ticket.state = state
    ticket.save!
  end

  def set_previous_state
    self.previous_state = ticket.state
  end
end
