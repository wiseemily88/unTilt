class AddAttributetoInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :attribute_1, :integer
    add_column :interviews, :attribute_2, :integer
    add_column :interviews, :attribute_3, :integer
    add_column :interviews, :attribute_4, :integer
  end
end
