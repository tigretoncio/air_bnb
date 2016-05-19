feature "sending emails" do

  let(:user) { User.first }

  scenario 'it calls the SendSignupAck service to send the link' do
    expect(SendSignupAck).to receive(:call)
    sign_up
  end
end