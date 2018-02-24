class Tribe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tribe_members
  has_many :users, through: :tribe_members
end
