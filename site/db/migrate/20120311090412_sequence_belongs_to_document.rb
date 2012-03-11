class SequenceBelongsToDocument < ActiveRecord::Migration
  def change
    rename_column :sequences, :translated_document_id, :document_id
  end
end
