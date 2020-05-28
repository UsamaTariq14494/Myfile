class Product < ApplicationRecord

	belongs_to :category

	has_many_attached :images

	validates  :name, uniqueness: true, presence: true 

end
