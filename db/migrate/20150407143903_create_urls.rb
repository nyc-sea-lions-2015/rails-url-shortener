class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :short, null: false
      t.string :long, null: false
      t.integer :click_count, default: 0
      t.timestamps
    end
  end
end
