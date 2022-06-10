class Oenologist < ApplicationRecord
    has_many :magazine_oenologists
    has_many :magazines, through: :magazine_oenologists, dependent: :destroy
    accepts_nested_attributes_for :magazine_oenologists, reject_if: :all_blank, allow_destroy: true
   
end
