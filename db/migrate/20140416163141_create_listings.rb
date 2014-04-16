class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.text :address
      t.decimal :price
      t.integer :user_id
    end
  end
end
