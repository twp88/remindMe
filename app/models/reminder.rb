class Reminder < ApplicationRecord
  scope :today, -> { where(time: Date.today) }
end
