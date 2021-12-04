class Project < ApplicationRecord
  include SetUid

  belongs_to :user
  has_many :floorplans, dependent: :destroy

  validates :name, presence: true
end
