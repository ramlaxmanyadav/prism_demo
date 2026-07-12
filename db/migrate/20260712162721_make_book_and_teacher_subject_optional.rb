class MakeBookAndTeacherSubjectOptional < ActiveRecord::Migration[8.1]
  def change
    change_column_null :books, :subject_id, true
    change_column_null :teachers, :subject_id, true
  end
end
