class RemoveContactEmailFromLead < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :contact_email, :string
  end
end
