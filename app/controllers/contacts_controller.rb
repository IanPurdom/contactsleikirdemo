class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index

    max = Contact.all.count

    if params[:limit].nil?
      @limit = 10
    else
      @limit = params[:limit].to_i
    end


    limit = @limit
    @number_of_pages = (max / limit) + 1

    if page_params[:page].nil?
      @page = 1
    else
      @page = page_params[:page]
    end

    @contacts = Contact.all.limit(@limit).offset( (@page.to_i - 1) * @limit)

  end

  def show
  end

  def new
     @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to contact_path(@contact)
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    @contact.save
    redirect_to contact_path(@contact)
  end

  def destroy
    @contact.destroy
    redirect_to contacts_path
  end

  def set_limit
    @limit = page_params[:limit]
    redirect_to contacts_path(limit: @limit)
  end


  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :adress, :phone)
  end

  def page_params
     params.permit(:page, :limit)
  end

end
