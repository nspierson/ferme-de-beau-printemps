class TestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.hello.subject
  #
    def hello
      mail(
        :subject => 'Hello from Postmark',
        :to  => 'contact@fermedebeauprintemps.fr',
        :from => 'contact@fermedebeauprintemps.fr',
        :html_body => '<strong>Hello</strong> dear Postmark user.',
        :track_opens => 'true')
    end
end
