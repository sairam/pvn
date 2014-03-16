class CreateLangs < ActiveRecord::Migration
  def up
    create_table :langs do |t|
      t.string  :slug,    :limit => 2,   :null => false
      t.string  :name,    :limit => 50,  :null => false
    end
    
    add_index   :langs,   :slug,         :unique => true
    
  end

  def down
    drop_table :langs
  end
end
