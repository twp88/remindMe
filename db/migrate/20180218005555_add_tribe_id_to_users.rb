class AddTribeIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tribe_id, :integer
  end
end
