class CreatePageEdits < ActiveRecord::Migration
  def change
    create_table :page_edits do |t|
      t.string :title
      t.text :body
      t.belongs_to :user
      t.belongs_to :page
      t.belongs_to :space

      t.timestamps
    end
    add_index :page_edits, :user_id
    add_index :page_edits, :page_id
    add_index :page_edits, :space_id
  end
end
