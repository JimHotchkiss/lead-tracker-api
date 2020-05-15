class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :product, :urgency, :status, :contact_email, :user_id, :contact_id
  belongs_to :user
  belongs_to :contact
end
