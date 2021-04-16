class Photo < ApplicationRecord
    belongs_to :album

    has_many :tags, dependent: :destroy
    accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }
    
    has_attached_file :image, styles: {  large: "1000x1000",medium: "300x300>", thumb: "100x100>", square: "300x100#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
   
end
