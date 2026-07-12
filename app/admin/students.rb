ActiveAdmin.register Student do
  menu label: "Students", parent: "School", priority: 4, html_options: { icon: :list }

  permit_params :first_name, :last_name, :email, :phone, :date_of_birth, :grade,
                :enrollment_number, :teacher_id, :active, subject_ids: []

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :grade
    column :enrollment_number
    column :teacher
    column :active do |student|
      prism_toggle_tag student.active
    end
    actions
  end

  filter :first_name
  filter :last_name
  filter :grade
  filter :teacher
  filter :active
  filter :enrollment_number

  form do |f|
    f.inputs "Student Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :date_of_birth
      f.input :grade
      f.input :enrollment_number
      f.input :teacher
      f.input :subjects, as: :check_boxes, collection: Subject.all
      f.input :active, as: :prism_toggle
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone
      row :date_of_birth
      row :grade
      row :enrollment_number
      row :teacher
      row(:active) { |student| prism_toggle_tag student.active }
      row :created_at
      row :updated_at
    end

    panel "Subjects" do
      table_for student.subjects do
        column(:name) { |subject| link_to subject.name, admin_subject_path(subject) }
        column :code
      end
    end
  end
end
