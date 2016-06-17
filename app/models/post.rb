class Post < ActiveRecord::Base
  belongs_to :user

  liquid_methods :name
end
