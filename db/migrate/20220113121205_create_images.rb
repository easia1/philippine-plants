class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text :caption
      t.text :source
      t.string :file_path
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
