class Tribe < ApplicationRecord
  belongs_to :user, optional: true
end
