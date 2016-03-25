class CreateRequotsRelationships < ActiveRecord::Migration
  def change
    create_table :requots_relationships do |t|
      t.integer :requotter_id
      t.integer :requot_id

      t.timestamps
    end
  end
end
