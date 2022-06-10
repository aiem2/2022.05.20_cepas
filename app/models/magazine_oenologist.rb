class MagazineOenologist < ApplicationRecord
    belongs_to :oenologist
    belongs_to :magazine

    def magazine_name
        id = self.magazine_id
        @magazine_name = Magazine.find(id).name
    end
    
    def oenologist_name
        id = self.oenologist_id
        @oenologist_name = Oenologist.find(id).name
    end
    
end