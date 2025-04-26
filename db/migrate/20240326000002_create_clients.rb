class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.string :gender, null: false
      t.text :address
      t.string :phone_number, null: false
      t.string :email, null: false
      t.timestamps
    end

    add_index :clients, :email, unique: true
    add_index :clients, :phone_number, unique: true
  end
end 