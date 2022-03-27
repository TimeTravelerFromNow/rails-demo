class CreateElems < ActiveRecord::Migration[7.0]
  def change
    create_table :elems do |t|
      t.string :element_type
      t.text :content
      t.references :article, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
