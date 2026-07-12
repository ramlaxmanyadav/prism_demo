ActiveAdmin.register Book do
  menu label: "Books", parent: "School", priority: 3, html_options: { icon: :box }

  permit_params :title, :isbn, :author, :subject_id, :published_on, :copies_count, :available

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :isbn
    column :subject
    column :copies_count
    column :available do |book|
      prism_toggle_tag book.available
    end
    actions
  end

  filter :title
  filter :author
  filter :subject
  filter :available
  filter :published_on

  form do |f|
    f.inputs "Book Details" do
      f.input :title
      f.input :author
      f.input :isbn
      f.input :subject
      f.input :published_on
      f.input :copies_count
      f.input :available, as: :prism_toggle
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :author
      row :isbn
      row :subject
      row :published_on
      row :copies_count
      row(:available) { |book| prism_toggle_tag book.available }
      row :created_at
      row :updated_at
    end
  end
end
