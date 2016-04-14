class Brand < ActiveRecord::Base
  has_and_belongs_to_many :brand_category_subcategories
end
