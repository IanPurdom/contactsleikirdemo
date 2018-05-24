class Tag < ApplicationRecord
  has_many :taggings
  has_many :contacts, through: :taggings

  attr_accessor :tag

end
