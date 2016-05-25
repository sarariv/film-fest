class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value, null: false
      t.references :user, null: false, index: true
      t.references :film, null: false, index: true

      t.timestamps null: false
    end
  end
end
