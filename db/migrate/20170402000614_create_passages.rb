class CreatePassages < ActiveRecord::Migration[5.0]
  def change
    create_table :passages do |t|
      t.integer :chain_id
      t.integer :number
      t.string :text
      t.integer :derivation
      t.integer :time_spent
      t.timestamps
    end
  end
end
