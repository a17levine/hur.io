class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :url
      t.string :alias
      t.references :user, index: true

      t.timestamps
    end
  end
end
