class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, limit: 300
      t.string :ancestry
      t.text :body
      t.belongs_to :space
      t.belongs_to :user
      t.belongs_to :last_editor
      t.timestamps
    end
    add_index :pages, :space_id
    add_index :pages, :user_id
    add_index :pages, :last_editor_id
  end
end
