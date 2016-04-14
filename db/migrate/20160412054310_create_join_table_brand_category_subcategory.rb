class CreateJoinTableBrandCategorySubcategory < ActiveRecord::Migration
  def change
    create_table :brands_categories_subcategories do |t|
      t.references :brand
      t.references :category
      t.references :sub_category
      t.timestamps null: false
    end
  end
end
