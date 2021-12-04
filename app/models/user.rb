class User < ApplicationRecord
  has_many :projects

  validates :email, uniqueness: { case_sensitive: true }, presence: true
end
