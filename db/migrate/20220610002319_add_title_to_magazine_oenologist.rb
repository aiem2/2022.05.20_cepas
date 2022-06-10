class AddTitleToMagazineOenologist < ActiveRecord::Migration[7.0]
  def change
    add_column :magazine_oenologists, :title, :string
  end
end
