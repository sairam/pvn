class CreateUserLangs < ActiveRecord::Migration
  def up
    create_table  :user_langs do |t|
      t.integer   :user_id,     :null => false
      t.integer   :lang_id,     :null => false
    end

    add_index     :user_langs,  :user_id
    add_index     :user_langs,  :lang_id
    add_index     :user_langs,  [:user_id, :lang_id],   :unique => true

  end

  def down
    drop_table :user_langs
  end
end
