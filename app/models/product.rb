class Product < ApplicationRecord

	belongs_to :category

	has_many_attached :images

	validates  :name, uniqueness: true, presence: true 
	default_scope { order('created_at DESC') }


end
