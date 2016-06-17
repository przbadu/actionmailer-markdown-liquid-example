class Product < ActiveRecord::Base
  belongs_to :category
  liquid_methods :price, :name, :category
end
