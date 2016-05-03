class Ticket < ActiveRecord::Base




  # Relations
  belongs_to :state
  belongs_to :project
  belongs_to :author, class_name: "User"
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags, uniq: true


  # Events
  before_create :assign_default_state

  # Apply "search" gem
  searcher do
    label :tag, from: :tags, field: "name"
    # label :state, from: :states, field: "name"
  end


  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
  # Apply gem "carrierwave"
  accepts_nested_attributes_for :attachments, reject_if: :all_blank



  attr_accessor :tag_names


  def tag_names=(names)
    @tag_names = names
    names.split.each do |name|
      self.tags << Tag.find_or_initialize_by(name: name)
    end
  end

  private
  def assign_default_state
    self.state ||= State.default
  end


end
