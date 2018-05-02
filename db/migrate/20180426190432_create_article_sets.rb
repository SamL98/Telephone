class CreateArticleSets < ActiveRecord::Migration[5.0]
  def change
    create_table :article_sets do |t|
      t.text :ps
      t.integer :pair
      t.integer :derivation
      t.boolean :is_lay
      t.timestamps
    end
  end
end
