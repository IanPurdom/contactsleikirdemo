class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index

    max = Contact.all.count

    if params[:limit].nil?
      if page_params[:limit].nil?
        @limit = 10
      else
        @limit = page_params[:limit]
      end
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
    @page = page_params[:page]
    @limit = page_params[:limit]
  end

  def new
    @page = page_params[:page]
    @limit = page_params[:limit]
    @contact = Contact.new
  end

  def create
    @page = contact_params[:page]
    @limit = contact_params[:limit]
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to contact_path(@contact, page: @page, limit: @limit)
  end

  def edit
    @page = page_params[:page]
    @limit = page_params[:limit]
  end

  def update
    @page = contact_params[:page]
    @limit = contact_params[:limit]
    @contact.update(contact_params)
    @contact.save
    redirect_to contacts_path(page: @page, limit: @limit)
  end

  def destroy
    @page = page_params[:page]
    @limit = page_params[:limit]
    @contact.destroy
    redirect_to contacts_path(page: @page, limit: @limit)
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
    params.require(:contact).permit(:first_name, :last_name, :email, :adress, :phone, :page, :limit)
  end

  def page_params
     params.permit(:page, :limit)
  end

end
