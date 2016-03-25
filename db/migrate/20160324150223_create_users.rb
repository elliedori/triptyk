class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :handle, null:false
      t.string :display_name, null:false
      t.string :description
      t.string :email, null:false
      t.string :password_hash, null:false
      t.string :gravator, null:false

      t.timestamps null:false
    end
  end
end
