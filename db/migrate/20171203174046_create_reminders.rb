class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.text :what
      t.text :where
      t.date :when

      t.timestamps
    end
  end
end
