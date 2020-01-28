class ContactsController < ApplicationController
  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contact_info_path, notice: "Les informations ont bien été mises à jour."
    else
      render 'edit'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :phone, :address)
  end
end
