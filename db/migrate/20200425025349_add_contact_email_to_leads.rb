class AddContactEmailToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :contact_email, :string\
  end
end
