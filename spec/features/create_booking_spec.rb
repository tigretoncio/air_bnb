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

end
