class Category < ActiveRecord::Base
  has_many :sub_categories, dependent: :destroy

  attr_accessor :sub_ids

end
