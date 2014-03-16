class RenameLinesToSentences < ActiveRecord::Migration
  def change
    remove_index    :lines,       :line_id
    remove_index    :sequences,   :line_id
                    
    rename_table    :lines,       :sentences
    rename_column   :sentences,   :line_id,   :sentence_id
    rename_column   :sequences,   :line_id,   :sentence_id

    add_index       :sentences,   :sentence_id
    add_index       :sequences,   :sentence_id

  end

end
