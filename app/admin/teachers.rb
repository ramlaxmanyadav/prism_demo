ActiveAdmin.register Teacher do
  menu label: "Teachers", parent: "School", priority: 2, html_options: { icon: :users }

  permit_params :first_name, :last_name, :email, :phone, :subject_id, :hire_date, :salary, :active

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :subject
    column :hire_date
    column :salary
    column :active do |teacher|
      prism_toggle_tag teacher.active
    end
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :subject
  filter :active
  filter :hire_date

  form do |f|
    f.inputs "Teacher Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :subject
      f.input :hire_date
      f.input :salary
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
      row :subject
      row :hire_date
      row :salary
      row(:active) { |teacher| prism_toggle_tag teacher.active }
      row :created_at
      row :updated_at
    end

    panel "Students" do
      table_for teacher.students do
        column(:name) { |student| link_to student.name, admin_student_path(student) }
        column :grade
      end
    end
  end
end
