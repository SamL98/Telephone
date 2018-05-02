class CreatePassages < ActiveRecord::Migration[5.0]
  def change
    create_table :passages do |t|
      t.string :text
      t.string :user
      t.boolean :is_lay
      t.integer :source
      t.timestamps
    end
  end
end
