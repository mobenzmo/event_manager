class Event < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, length: { minimum: 10 }
  validates :date, presence: true, comparison: { greater_than: Date.today, message: "can't be in the past" }
end
