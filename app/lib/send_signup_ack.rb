require 'mailgun'
class SendSignupAck

  def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(ENV['API_KEY'])
  end

  def self.call(user, mailer = nil)
   new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['DOMAIN'], {from: "makers@mail.com",
     to: user.email,
     subject: "Welcome to Makersbnb",
     text: "Bienvenido! Lo vas a pasar muy bien aqui" })
  end

private
attr_reader :mailer
end