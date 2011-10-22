class CreateDocuments < ActiveRecord::Migration
  def up
    create_table :documents do |t|
      t.string  :title,   :null => false
      t.string  :slug,    :null => false,   :uniq => true
      t.integer :lang_id, :null => false
      t.text    :meta
      t.string  :source
      t.boolean :hidden
      t.integer :user_id, :null => false
      t.timestamps
    end

    add_index :documents, :slug,      :unique => true
    add_index :documents, :lang_id
    add_index :documents, :hidden
    add_index :documents, :user_id

  end

  def down
    drop_table :documents
  end
end
