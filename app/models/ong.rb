class Ong < ApplicationRecord
  has_many :pets
  belongs_to :user
  
#TODO add Gem Kaminari
  def self.search(query)
    where('nome LIKE ?', "%#{query}%")
  end
end
