class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: user.email, subject: "Confirmation d'inscription - Ferme de Beau Printemps"
  end

  def order_delivery(user)
    @user = user

    mail to: user.email, subject: "Livraison de votre commande - Ferme de Beau Printemps"
  end

  def order_success(name, email)

    mail to: email, subject: " #{name}, confirmation de votre commande - Ferme de Beau Printemps"
  end
end
