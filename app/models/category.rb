class Category < ActiveRecord::Base
  has_many :sub_categories

  attr_accessor :sub_ids

end
