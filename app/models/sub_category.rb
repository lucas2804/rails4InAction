class SubCategory < ActiveRecord::Base
  validates :name, presence: true
end
