class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :product, :urgency, :status, :contact_email
  belongs_to :user
  belongs_to :contact
end
