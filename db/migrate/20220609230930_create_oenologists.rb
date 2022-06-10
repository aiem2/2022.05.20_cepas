class CreateOenologists < ActiveRecord::Migration[7.0]
  def change
    create_table :oenologists do |t|
      t.string :name
      t.date :dob
      t.string :nationality

      t.timestamps
    end
  end
end
