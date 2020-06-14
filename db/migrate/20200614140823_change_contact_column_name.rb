class ChangeContactColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :name, :contact_name
  end
end
