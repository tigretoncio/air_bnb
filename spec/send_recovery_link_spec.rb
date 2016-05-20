require './app/lib/send_recovery_link'
require 'dotenv'

describe SendRecoverLink do

 let(:user){double :user, email: "test@test.com", password_token: "12345678"}
 let(:mail_gun_client){double :mail_gun_client}
 let(:sandbox_domain_name) { ENV["DOMAIN"] }

 Dotenv.load

 it "sends a message to mailgun when it is called" do
   params = {from: "airbnb@mail.com",
     to: user.email,
     subject: "reset your password",
     text: "click here to reset your password http://localhost:9292/users/password_reset?token=#{user.password_token}" }
     expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
     described_class.call(user, mail_gun_client)
   end
 end