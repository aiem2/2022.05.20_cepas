class AddRatoToOenologistWines < ActiveRecord::Migration[7.0]
  def change
    add_column :oenologist_wines, :rate, :integer
    
  end
end
