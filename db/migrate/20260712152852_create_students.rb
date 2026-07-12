class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :date_of_birth
      t.string :grade
      t.string :enrollment_number
      t.references :teacher, null: true, foreign_key: true
      t.boolean :active

      t.timestamps
    end

    add_index :students, :email, unique: true
    add_index :students, :enrollment_number, unique: true
  end
end
