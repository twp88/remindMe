class CreateTribeMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :tribe_members do |t|
      t.integer :user_id
      t.integer :tribe_id

      t.timestamps
    end
  end
end
