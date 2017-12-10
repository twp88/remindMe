class ChangeWhenToTime < ActiveRecord::Migration[5.0]
  def change
    rename_column :reminders, :when, :time
  end
end
