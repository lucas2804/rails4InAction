class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :title
      t.string :description
      t.references :project

      t.timestamps null: false
    end
  end
end
