class CreateTeachers < ActiveRecord::Migration[8.1]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.references :subject, null: false, foreign_key: true
      t.date :hire_date
      t.decimal :salary
      t.boolean :active

      t.timestamps
    end

    add_index :teachers, :email, unique: true
  end
end
