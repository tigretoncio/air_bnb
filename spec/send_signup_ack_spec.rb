require './app/lib/send_signup_ack'
require 'dotenv'

describe SendSignupAck do
  # DOMAIN = "sandbox095db3c079904d219e00440da5443f4c.mailgun.org"
 let(:user){double :user, email: "test@test.com", password_token: "12345678", name: "sergio"}
 let(:mail_gun_client){double :mail_gun_client}
 let(:sandbox_domain_name) { ENV['DOMAIN'] }

 Dotenv.load

# ENV["sandbox_domain_name"]
 it "sends a message to mailgun when it is called" do
   params = {from: "makers@mail.com",
             to: user.email,
             subject: "Welcome to Makersbnb",
             text: "Bienvenido! Lo vas a pasar muy bien aqui" }
   expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
   described_class.call(user, mail_gun_client)
 end
end
