class LeadSerializer
  include FastJsonapi::ObjectSerializer
  attributes :description, :product, :urgency, :status, :user, :contact
end
