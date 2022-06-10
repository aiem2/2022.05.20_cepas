class ChangeMagazinesOenologistsTable < ActiveRecord::Migration[7.0]
  def change
    rename_table "Magazines_Oenologists", "magazine_oenologists"
    add_column :magazine_oenologists, :id, :primary_key
    add_column :magazine_oenologists, :available, :boolean, default: true
  end
end
