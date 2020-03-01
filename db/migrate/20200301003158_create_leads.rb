class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :description
      t.string :product
      t.string :urgency
      t.string :status

      t.timestamps
    end
  end
end
