# feature "create a new space" do
#   scenario "add a new space to my spaces" do
#     sign_up
#     expect { create_space }.to change(Peep, :count).by(1)
#     expect(page).to have_content "My first space"
#     expect(page).to have_content "Amy"
#     expect(Peep.first.message).to eq("My first space")
#   end
#
#   scenario "see what time the space was created" do
#     sign_up
#     create_space
#     expect(page).to have_content "#{Time.now.strftime("%H:%M %d-%m-%Y ")}"
#   end
#
#   scenario "cannot write a space if not logged in" do
#     sign_up
#     logout
#     visit "/spaces/new"
#     expect(page).to have_content "Please login to space"
#   end
#
#   scenario "cannot create space if no message" do
#     sign_up
#     expect { create_space(nil) }.to change(Peep, :count).by(0)
#   end
# end
