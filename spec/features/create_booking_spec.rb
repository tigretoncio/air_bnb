feature "create a new booking" do
  scenario "add a new booking to list of bookings" do
    pre_create_booking
    expect{create_booking}.to change(Booking, :count).by(1)
  end

  scenario "cannot create a booking if not logged in" do
    sign_up
    create_space
    logout
    visit "/spaces"
    click_link "space#{Space.first.id}"
    expect(current_path).to eq "/sessions/new"
  end

  scenario "cannot create booking if no date" do
    pre_create_booking
    expect{create_booking(nil)}.to change(Booking, :count).by(0)
  end

  scenario "cannot create booking if unavailable date" do
    pre_create_booking
    create_booking
    logout
    login
    visit "/bookings"
    click_link "booking#{Booking.first.id}"
    click_button "Confirm"
    logout
    params = {name: "Sergio",
              username: "sergio",
              email: "sergio@gmail.com",
              password: "my_password",
              password_confirmation: "my_password"}
    sign_up(params)
    visit "/spaces"
    click_link "space#{Space.first.id}"
    fill_in :date, with: Time.new(2016,5,30)
    expect{click_button "Request to book"}.to change(Booking, :count).by(0)
  end

end
