class AddConfirmColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :unconfirmed_email, :string
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :string
    add_column :users, :confirmation_sent_at, :datetime
    add_index :users, :confirmation_token, :unique => true
    User.update_all(:confirmed_at => Time.now) #your current data
  end

  def down
    remove_column :users, :unconfirmed_email, :string
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :string
    remove_column :users, :confirmation_sent_at, :datetime
  end
end
