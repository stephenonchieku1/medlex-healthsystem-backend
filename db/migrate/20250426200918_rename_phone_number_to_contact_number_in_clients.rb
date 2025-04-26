class RenamePhoneNumberToContactNumberInClients < ActiveRecord::Migration[8.0]
  def change
    rename_column :clients, :phone_number, :contact_number
  end
end
