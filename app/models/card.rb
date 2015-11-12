class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  has_and_belongs_to_many :labels
end
