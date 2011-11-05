class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, limit: 100
      t.belongs_to :user
      t.timestamps
    end
  end
end
