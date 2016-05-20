feature "logging out" do
  before do
    allow(SendSignupAck).to receive(:call)
  end
  scenario "click logout button to delete session of user" do
    sign_up
    logout
    expect(page).not_to have_content "Hello Amy!"
    expect(current_path).to eq "/spaces"
  end
end
