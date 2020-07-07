class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: user.email, subject: "Ferme de Beau Printemps - Confirmation d'inscription"
  end

  def order_delivery(user)
    @user = user

    mail to: user.email, subject: "Ferme de Beau Printemps - Livraison de votre commande"
  end

  def order_success(name, email)
    mail to: email, subject: "Ferme de Beau Printemps - Confirmation de votre commande"
  end
end
