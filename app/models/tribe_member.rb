class TribeMember < ApplicationRecord
  belongs_to :tribe
  belongs_to :user
end
