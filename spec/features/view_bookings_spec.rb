feature "view booking" do

  before do
    allow(SendSignupAck).to receive(:call)
  end

  scenario "view list of bookings via 'Bookings' link at top of page" do
    sign_up
    visit "/bookings"
    expect(page).to have_content "My Bookings"
  end

  scenario "don't view list of bookings if not logged in" do
    visit "/bookings"
    expect(current_path).to eq "/sessions/new"
  end

  scenario "redirect to list of bookings when create a booking" do
    pre_create_booking
    create_booking
    expect(page).to have_content "My Bookings"
  end

  scenario "view bookings I've made (as a customer)" do
    pre_create_booking
    create_booking
    expect(page).to have_content "Maria"
    expect(page).to have_content "Amy's house"
  end

  scenario "view list of bookings I've receieved (as a space owner)" do
    pre_create_booking
    create_booking
    logout
    params = {name: "Sergio",
              username: "sergio",
              email: "sergio@gmail.com",
              password: "my_password",
              password_confirmation: "my_password"}
    sign_up(params)
    create_booking
    logout
    login
    visit "/bookings"
    expect(page).to have_content "Maria"
    expect(page).to have_content "Sergio"
    expect(page).to have_content "Amy's house"
    expect(page).to have_content "2016-05-30"
  end

  scenario "viewing each booking I've received in more detail" do
    pre_create_booking
    create_booking
    logout
    login
    visit "/bookings"
    click_link "booking#{Booking.first.id}"
    expect(page).to have_content "Maria"
    expect(page).to have_content "Amy's house"
    expect(page).to have_css("form input#confirm")
  end

end
