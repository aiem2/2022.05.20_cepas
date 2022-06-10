class DropOenologist < ActiveRecord::Migration[7.0]
  def change
    drop_table :oenologists
  end
end
