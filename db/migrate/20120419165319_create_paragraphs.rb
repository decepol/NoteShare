class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.integer :prev_id
      t.integer :next_id
      t.text :body

      t.timestamps
    end
    
    add_index :paragraphs, :prev_id
    add_index :paragraphs, :next_id
  end
end
