ActiveAdmin.register Staff do
  menu label: "Staff", parent: "School", priority: 5, html_options: { icon: :settings }

  permit_params :first_name, :last_name, :email, :phone, :designation, :department, :hire_date, :salary, :active

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :designation
    column :department
    column :hire_date
    column :active do |staff|
      prism_toggle_tag staff.active
    end
    actions
  end

  filter :first_name
  filter :last_name
  filter :designation
  filter :department
  filter :active

  form do |f|
    f.inputs "Staff Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :designation
      f.input :department
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
      row :designation
      row :department
      row :hire_date
      row :salary
      row(:active) { |staff| prism_toggle_tag staff.active }
      row :created_at
      row :updated_at
    end
  end
end
