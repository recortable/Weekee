class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :tuid, limit: 300
      t.integer :login_count, default: 0
      t.datetime :last_login_at
      t.timestamps
    end
  end
end
