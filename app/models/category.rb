class Category < ApplicationRecord

	has_many :products

	has_one_attached :image

	validates  :name, uniqueness: true, presence: true 
	default_scope { order('created_at DESC') }

end
	