class CreateChains < ActiveRecord::Migration[5.0]
  def change
    create_table :chains do |t|
      t.string :identifier
      t.timestamps
    end
  end
end
