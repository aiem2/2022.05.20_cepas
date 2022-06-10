class ChangeOenologistsWinesTable < ActiveRecord::Migration[7.0]
  def change
    rename_table 'oenologists_wines', 'oenologist_wines'
    add_column :oenologist_wines, :id, :primary_key
    add_column :oenologist_wines, :available, :boolean, default: true
  end
end
