class RenameRelationsWithDocumentLanguageId < ActiveRecord::Migration
  def up
    rename_column :sentences, :document_language_id, :translated_document_id
    rename_column :sequences, :document_language_id, :translated_document_id
  end

  def down
  end
end
