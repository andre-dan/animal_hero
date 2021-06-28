class Ong < ApplicationRecord
  has_many :pets
  belongs_to :user
end
