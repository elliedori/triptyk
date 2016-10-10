class CreateDestinationsTable < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name
  end
end
