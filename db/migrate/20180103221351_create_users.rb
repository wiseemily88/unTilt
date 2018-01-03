class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :department
      t.string :email
      t.string :password_digest
      t.integer :role,  default: 0
      t.integer :gender
      t.integer :race
      t.integer :education_level
      t.integer :age
      t.integer :tenure

      t.timestamps
    end
  end
end
