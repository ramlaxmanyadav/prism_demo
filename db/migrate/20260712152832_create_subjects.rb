class CreateSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end

    add_index :subjects, :code, unique: true
  end
end
