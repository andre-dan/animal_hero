class AddfieldToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :breed, :string
    add_column :pets, :sex, :string
    add_column :pets, :weight, :integer
  end
end
