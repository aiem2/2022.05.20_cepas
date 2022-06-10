class OenologistWine < ApplicationRecord
    belongs_to :oenologist
    belongs_to :wine

    def oenologist_name
        id = self.oenologist_id
        @oenologist_name = Oenologist.find(id).name
    end
    
    def wine_name
        id = self.wine_id
        @wine_name = Wine.find(id).name
    end
end