class ChangeColumnsNameToMagazineOenologist < ActiveRecord::Migration[7.0]
  def change
    rename_column :magazine_oenologists, :Oenologist_id, :oenologist_id
    rename_column :magazine_oenologists, :Magazine_id, :magazine_id
  end
end
