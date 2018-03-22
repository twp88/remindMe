require 'elasticsearch/model'

class Reminder < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  scope :today, -> { where(time: Date.today) }
end

Reminder.import(force: true) # autosync model for indexing with elasticsearch
