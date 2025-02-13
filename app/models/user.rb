class User < ApplicationRecord
  # link this model to the Event model
  # and use the Active Record links to make sure that parents delete their children records on cascade
  has_many :events, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
