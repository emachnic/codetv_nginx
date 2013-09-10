class ChangeMoodColumn < ActiveRecord::Migration
  def change
    remove_column :entries, :mood
    add_column    :entries, :mood_id, :integer
  end
end
