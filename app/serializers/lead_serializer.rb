class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :product, :urgency, :status
  belongs_to :user
  belongs_to :contact
end
