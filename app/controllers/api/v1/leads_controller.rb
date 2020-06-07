class Api::V1::LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :update, :destroy]
  # before_action :assign_contact, only: [:create]

  def index
    @leads = Lead.all
    render json: LeadSerializer.new(@leads)
  end

  def show
    render json: @lead
  end

  def create

    # user_id === session[:user_id].id
    # contact_id === contact.id

    @contact = Contact.where("email" => lead_params[:email]).first_or_create do |contact|
binding.pry
       contact.name = lead_params[:contact_name]
       contact.phone_number = lead_params[:phone_number]
       contact.save
     end 
     
    @lead = Lead.new(lead_params)

    if @lead.save
      render json: @lead, status: :created, location: @lead
    else
      render json: @lead.errors, status: :unprocessable_entity
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

    def assign_contact 
      @contact = Contact.where("email" => params[:lead][:email]).first_or_create do |contact|
       binding.pry
       
        contact.name = params[:lead][:contact_name]
        contact.phone_number = [:lead][:phone_number]
        contact.save
      end 
    end 

    def lead_params
      params.require(:lead).permit(:description, :product, :urgency, :status, :user_id, :contact_id, :contact_name, :email, :phone_number)
    end
end
