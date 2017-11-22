class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]

	def index
		@contacts = Contact.all.order("last_contacted DESC")
	end

	def show
	end

	def new
		@contact = Contact.new
	end

	def edit
	end

	def create
		@contact = Contact.new(contact_params)

		respond_to do |format|
			if @contact.save
				format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
				format.json { render :show, status: :created, location: @contact }
			else
				format.html { render :new }
				format.json { render json: @contact.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @contact.update(contact_params)
				format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
				format.json { render :show, status: :ok, location: @contact }
			else
				format.html { render :edit }
				format.json { render json: @contact.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@contact.destroy
		respond_to do |format|
			format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def update_last_contacted
		set_contact
		begin @contact.update_attribute(:last_contacted, Date.today)
			redirect_to contacts_path
		rescue
			puts @contact.inspect
			@contacts = Contact.all.order("last_contacted DESC")
			flash[:error] = @contact
			render :index
		end
	end

	private
		def set_contact
			@contact = Contact.find(params[:id])
		end

		def contact_params
			params.fetch(:contact, {})
		end
end
