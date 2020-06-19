class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :product, :urgency, :status, :user_id, :contact_id, :contact
  belongs_to :user
  belongs_to :contact
end
