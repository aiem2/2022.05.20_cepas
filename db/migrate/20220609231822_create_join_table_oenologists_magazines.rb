class CreateJoinTableOenologistsMagazines < ActiveRecord::Migration[7.0]
  def change
    create_join_table :Oenologists, :Magazines do |t|
      # t.index [:oenologist_id, :magazine_id]
      # t.index [:magazine_id, :oenologist_id]
    end
  end
end
