class Pet < ApplicationRecord
  belongs_to :ong
  has_one_attached :avatar
  
  enum species: { cachorro:1, gato:3, coelho:5, calopsyta:7 }
 
  def self.search(query)
    where('name LIKE :q OR situation LIKE :q', q: "%#{query}%")
  end
end
