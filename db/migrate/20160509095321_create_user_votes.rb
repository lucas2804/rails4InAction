class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id
      t.integer :joke_id
      t.boolean :voted

      t.timestamps null: false
    end
  end
end
