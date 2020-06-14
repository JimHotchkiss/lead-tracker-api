class Api::V1::LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :update, :destroy]
  before_action :set_contact

  def index
    binding.pry
    @leads = Lead.all
    render json: LeadSerializer.new(@leads)
  end

  def show
    render json: @lead
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.contact_id = @contact.id
    @lead.user_id = session[:user_id].id
    if @lead.save
      render json: @lead
    else
      render json: {error: "Lead did not save"}
    end
  end

  def update
    if @lead.update(lead_params)
      render json: @lead
    else
      render json: @lead.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @lead.destroy
  end

  private

    def set_lead
      @lead = Lead.find(params[:id])
    end 

    def set_contact
      @contact = Contact.where(:email => params[:lead][:email]).first_or_create do |contact|
        contact.contact_name = params[:lead][:contact_name]
        contact.phone_number = params[:lead][:phone_number]
      end 

    end 

    def lead_params
      params.require(:lead).permit(:description, :product, :urgency, :status, :user_id, :contact_id)
    end
end
