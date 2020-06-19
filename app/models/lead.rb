class Lead < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  def self.find_contact(contact_id)
    return @contact = Contact.find(contact_id)
  end 
end
