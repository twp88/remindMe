class AddColumnToReminders < ActiveRecord::Migration[5.0]
  def change
    add_column :reminders, :tribe_id, :integer
  end
end
