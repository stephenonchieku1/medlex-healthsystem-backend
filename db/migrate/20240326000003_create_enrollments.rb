class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments, id: :uuid do |t|
      t.references :client, type: :uuid, null: false, foreign_key: true
      t.references :health_program, type: :uuid, null: false, foreign_key: true
      t.date :enrollment_date, null: false
      t.string :status, null: false, default: 'active'
      t.timestamps
    end

    add_index :enrollments, [:client_id, :health_program_id], unique: true
  end
end 