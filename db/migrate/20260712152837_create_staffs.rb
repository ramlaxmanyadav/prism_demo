class CreateStaffs < ActiveRecord::Migration[8.1]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :designation
      t.string :department
      t.date :hire_date
      t.decimal :salary
      t.boolean :active

      t.timestamps
    end

    add_index :staffs, :email, unique: true
  end
end
