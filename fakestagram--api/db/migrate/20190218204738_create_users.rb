class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
