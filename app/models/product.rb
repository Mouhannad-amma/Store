class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, :img_url, :price, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :img_url, allow_blank: true, format: {
		with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
	}
	validates :title, length: {minimum: 10}

	def self.latest
		Product.order(:updated_at).last
	end


	def ensure_not_referenced_by_any_line_item
		if line_items.blank?
			true
		else
			false
		end
	end

end
