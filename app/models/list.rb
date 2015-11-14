class List < ActiveRecord::Base
  belongs_to :user
  has_many :cards, -> { order(:position) }

  validates :title, :position, presence: true
end
