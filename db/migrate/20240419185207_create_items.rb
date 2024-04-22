class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.string :thumbnail
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
