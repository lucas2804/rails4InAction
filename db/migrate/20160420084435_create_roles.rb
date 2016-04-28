class CreateRoles < ActiveRecord::Migration
  def change
    if (table_exists? :roles == false)
      create_table :roles do |t|
        t.references :user, index: true, foreign_key: true
        t.string :role
        t.timestamps null: false
      end
    end

  end
end
