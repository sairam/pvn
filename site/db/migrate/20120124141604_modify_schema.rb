class ModifySchema < ActiveRecord::Migration
  def change
    remove_column :comments, :title
    remove_column :comments, :subject

    rename_table  :document_langs, :translated_documents
    rename_column :translated_documents, :lang_id, :language_id
    rename_column :translated_documents, :completed, :is_complete

    rename_column :documents, :lang_id, :source_language_id
    remove_column :documents, :source
    rename_column :documents, :hidden, :is_hidden

    rename_table  :langs, :languages

    rename_column :sentences, :document_lang_id, :document_language_id
    rename_column :sentences, :approved, :is_approved

    rename_column :sequences, :document_lang_id, :document_language_id

    rename_table  :user_langs, :languages_users
    rename_column :languages_users, :lang_id, :language_id

    remove_column :users, :first_name
    rename_column :users, :last_name, :name
    remove_column :users, :username
  end
end
