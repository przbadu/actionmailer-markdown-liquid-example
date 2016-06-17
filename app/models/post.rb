class Post < ActiveRecord::Base
  belongs_to :user

  liquid_methods :products

  def products
    Product.all
  end
end
