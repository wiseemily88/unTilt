class RenameCompentenciesTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :compentencies, :competencies
  end
end
