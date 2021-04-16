class Album < ApplicationRecord
	belongs_to :user
	has_many :photos, dependent: :destroy
	has_attached_file :image,styles: {  large: "900x700", medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	
	def start_time
		self.updated_at
	end
end
