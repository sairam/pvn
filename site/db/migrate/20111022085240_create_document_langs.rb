class CreateDocumentLangs < ActiveRecord::Migration
  def up
    create_table  :document_langs do |t|
      t.integer   :document_id,         :null => false
      t.integer   :lang_id,             :null => false
      t.integer   :percent_complete,    :null => false
      t.boolean   :completed,           :null => false
    end
    add_index     :document_langs,      :document_id
    add_index     :document_langs,      :lang_id
    add_index     :document_langs,      [:document_id, :lang_id],   :unique => true
    add_index     :document_langs,      :completed
  end

  def down
    drop_table    :document_langs
  end
end
