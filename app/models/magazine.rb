class Magazine < ApplicationRecord
    has_many :magazine_oenologists
    has_many :oeologists, through: :magazine_oenologists, dependent: :destroy
end
