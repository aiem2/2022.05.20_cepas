class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :oenologists
    drop_table :job_titles
  end
end
