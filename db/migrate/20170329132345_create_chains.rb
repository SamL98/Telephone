class CreateChains < ActiveRecord::Migration[5.0]
  def change
    create_table :chains do |t|
      t.integer :identifier
      t.timestamps
    end
  end
end
