class CreateHealthPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :health_programs, id: :uuid do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :active, default: true
      t.timestamps
    end

    add_index :health_programs, :name, unique: true
  end
end 