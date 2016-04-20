class CreateAdminBooks < ActiveRecord::Migration
  def change
    create_table :admin_books do |t|

      t.timestamps null: false
    end
  end
end
