class CreateLines < ActiveRecord::Migration
  def up
    create_table  :lines do |t|
      t.integer   :user_id,           :null => false
      t.integer   :line_id
      t.integer   :document_lang_id,  :null => false
      t.text      :data,              :null => false
      t.boolean   :approved
      t.timestamps
    end

    add_index     :lines,   :user_id
    add_index     :lines,   :line_id
    add_index     :lines,   :document_lang_id
    add_index     :lines,   :approved
    add_index     :lines,   [:document_lang_id,:approved]

  end

  def down
    drop_table    :lines
  end
end
