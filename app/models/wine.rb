class Wine < ApplicationRecord
    has_many :wine_strains
    has_many :strains, through: :wine_strains
    accepts_nested_attributes_for :wine_strains, reject_if: :all_blank, allow_destroy: true

    has_many :oenologist_wines
    has_many :oenologists, through: :oenologist_wines
    accepts_nested_attributes_for :oenologist_wines, reject_if: :all_blank, allow_destroy: true


end
