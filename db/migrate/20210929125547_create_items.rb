class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :info
      t.integer :user_id
      t.string :itemimage

      t.timestamps
    end
  end
end
