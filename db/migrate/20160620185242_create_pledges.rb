class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reward, index: true, foreign_key: true
      t.integer :amount     #pledge amt
      t.decimal :shipping   #shipping cost
      t.date :expiration_date #pledge expiration date
      t.string :uuid
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :postal_code
      t.string :status      #pledge status

      t.timestamps null: false
    end
  end
end
