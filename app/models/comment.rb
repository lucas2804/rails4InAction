class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :ticket
  delegate :project, to: :ticket

  # Important ref state               -> state_id
  #           ref previous_state_id   -> previous_state_id
  belongs_to :state
  belongs_to :previous_state, class_name: "State"


  # Events
  before_create :set_previous_state
  after_create :set_ticket_state
  after_create :associate_tags_with_ticket

  scope :persisted, lambda { where.not(id: nil) }

  attr_accessor :tag_names

  validates :text, presence: true


  def associate_tags_with_ticket
    if tag_names
      tag_names.split.each do |name|
        ticket.tags << Tag.find_or_create_by(name: name)
      end
    end
  end

  private
  def set_ticket_state
    ticket.state = state
    ticket.save!
  end

  def set_previous_state
    self.previous_state = ticket.state
  end
end
