class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :product, :urgency, :status, :user, :contact
  belongs_to :user
  belongs_to :contact
end
