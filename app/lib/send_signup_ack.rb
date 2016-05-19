require 'mailgun'

class SendSignupAck
  API_KEY = "key-6ca3e604595256140e5c595495ab2cfe"
  DOMAIN = "sandbox095db3c079904d219e00440da5443f4c.mailgun.org"
 def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(API_KEY)
 end

 def self.call(user, mailer = nil)
   new(mailer: mailer).call(user)
 end

 def call(user)
  mailer.send_message(DOMAIN, {from: "airbnb@mail.com",
     to: user.email,
     subject: "Welcome to Airbnb",
     text: "Bienvenido! Lo vas a pasar muy bien aqui" })
 end

 private
 attr_reader :mailer
end