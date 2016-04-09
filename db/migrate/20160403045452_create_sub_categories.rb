class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.belongs_to :category, dependent: :restrict
      t.boolean :published
      t.timestamps null: false
    end
  end
end
