class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  liquid_methods :email
end
