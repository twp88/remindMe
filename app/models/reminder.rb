class Reminder < ApplicationRecord
  belongs_to :user
  scope :today, -> { where(time: Date.today) }
end
