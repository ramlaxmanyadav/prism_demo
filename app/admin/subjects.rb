ActiveAdmin.register Subject do
  menu label: "Subjects", parent: "School", priority: 1, html_options: { icon: :folder }

  permit_params :name, :code, :description

  index do
    selectable_column
    id_column
    column :name
    column :code
    column "Teachers" do |subject|
      subject.teachers.count
    end
    column "Books" do |subject|
      subject.books.count
    end
    column "Students" do |subject|
      subject.students.count
    end
    actions
  end

  filter :name
  filter :code
  filter :created_at

  form do |f|
    f.inputs "Subject Details" do
      f.input :name
      f.input :code
      f.input :description
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :code
      row :description
      row :created_at
      row :updated_at
    end

    panel "Teachers" do
      table_for subject.teachers do
        column(:name) { |teacher| link_to teacher.name, admin_teacher_path(teacher) }
        column :email
      end
    end

    panel "Books" do
      table_for subject.books do
        column(:title) { |book| link_to book.title, admin_book_path(book) }
        column :author
      end
    end
  end
end
