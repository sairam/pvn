class CreateSequences < ActiveRecord::Migration
  def up
    create_table  :sequences do |t|
      t.integer   :document_lang_id,  :null => false
      t.float     :sequence,          :null => false
      t.integer   :line_id,           :null => false
      t.timestamps
    end

    add_index     :sequences,         :document_lang_id
    add_index     :sequences,         :line_id

  end

  def down
    drop_table    :sequences
  end
end
