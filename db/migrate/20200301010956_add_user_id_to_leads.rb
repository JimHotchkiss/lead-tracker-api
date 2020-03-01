class AddUserIdToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :user_id, :integer
  end
end
