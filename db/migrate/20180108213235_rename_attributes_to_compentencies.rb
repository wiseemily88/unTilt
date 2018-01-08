class RenameAttributesToCompentencies < ActiveRecord::Migration[5.1]
  def change
    rename_table :attributes, :compentencies
  end
end
