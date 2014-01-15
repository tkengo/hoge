class InitializeTables < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :nick_name
      t.column :deleted, :tinyint, default: 0
      t.timestamps
    end

    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.column :deleted, :tinyint, default: 0
      t.timestamps
    end
  end
end
