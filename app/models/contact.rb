class Contact < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :first_name, presence: true
  validates :last_name, presence: true
end
