class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :contact
  accepts_nested_attributes_for :contact
 

  # def contact_attributes=(contact_attributes)
  #   binding.pry
  #   contact_attributes.each do |contact_attribute|
  #     self.contact.build(contact_attribute)
  #   end 
  # end 
end
