require 'mailgun'
class SendRecoverLink

 def initialize(mailer: nil)
   @mailer = mailer || Mailgun::Client.new(ENV["API_KEY"])
 end

 def self.call(user, mailer = nil)
   new(mailer: mailer).call(user)
 end

 def call(user)
   mailer.send_message(ENV["DOMAIN"], {from: "airbnb@mail.com",
       to: user.email,
       subject: "reset your password",
       text: "click here to reset your password http://localhost:9292/users/password_reset?token=#{user.password_token}" })
 end

 private
 attr_reader :mailer
end