class Oenologist < ApplicationRecord
    has_many :magazine_oenologists
    has_many :magazines, through: :magazine_oenologists, dependent: :destroy
    accepts_nested_attributes_for :magazine_oenologists, reject_if: :all_blank, allow_destroy: true
   
    has_many :oenologist_wines
    has_many :wines, through: :oenologist_wines, dependent: :destroy
    accepts_nested_attributes_for :oenologist_wines, reject_if: :all_blank, allow_destroy: true

end
