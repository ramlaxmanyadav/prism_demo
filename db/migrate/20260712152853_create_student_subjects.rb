class CreateStudentSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :student_subjects do |t|
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end

    add_index :student_subjects, [:student_id, :subject_id], unique: true
  end
end
