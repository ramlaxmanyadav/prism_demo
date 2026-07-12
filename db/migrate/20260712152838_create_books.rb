class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :author
      t.references :subject, null: false, foreign_key: true
      t.date :published_on
      t.integer :copies_count
      t.boolean :available

      t.timestamps
    end

    add_index :books, :isbn, unique: true
  end
end
