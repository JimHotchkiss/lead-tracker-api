class AddContactIdToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :contact_id, :integer
  end
end
