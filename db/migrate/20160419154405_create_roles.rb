class CreateRoles < ActiveRecord::Migration
  def change

    unless table_exists? "roles"
      create_table :roles do |t|
        t.references :user, index: true, foreign_key: true
        t.string :role
        t.references :project, index: true, foreign_key: true

        t.timestamps null: false
      end

    end

  end
end
