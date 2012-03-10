class AddDefaultFields < ActiveRecord::Migration
  def up
    change_column_default :translated_documents,  :percent_complete, 0
    change_column_default :translated_documents,  :is_complete, false
    change_column_default :documents,             :is_hidden  , false
  end

  def down
  end
end
