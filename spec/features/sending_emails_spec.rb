feature "sending emails" do
  scenario 'it calls the SendSignupAck service to send the link' do
    expect(SendSignupAck).to receive(:call).with(user)
    sign_up
  end
end