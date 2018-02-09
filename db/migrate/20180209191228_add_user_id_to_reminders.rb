class AddUserIdToReminders < ActiveRecord::Migration[5.0]
  def change
    add_column :reminders, :user_id, :integer
  end
end
