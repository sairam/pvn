class InverseHasOneSentenceSequenceRelation < ActiveRecord::Migration
  def up
    remove_column :sequences, :sentence_id
    add_column    :sentences, :sequence_id, :integer
  end

  def down
    remove_column :sentences, :sentence_id
    add_column    :sequences, :sequence_id, :integer
  end
end
