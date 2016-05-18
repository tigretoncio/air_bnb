feature "confirm bookings I've received" do

  let(:booking) { Booking.first }

  scenario "viewing other bookings received for the same space, same night" do
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
    click_link "booking#{booking.id}"
    expect(page).to have_content "Maria"
    expect(page).to have_content "Sergio"
    expect(page).to have_content "Amy's house"
  end

  scenario "Only show the main booking above the confirm button, not in the Other Bookings box" do
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
    click_link "booking#{booking.id}"
    confirm_button_index = page.body.index("Confirm")
    maria_name_index = page.body.index("Maria")
    expect(maria_name_index).to be < confirm_button_index
  end

  scenario "confirm a booking I have received" do
    pre_create_booking
    create_booking
    logout
    login
    visit "/bookings"
    click_link "booking#{booking.id}"
    expect{click_button "Confirm"}.to change{Booking.first.status}
    expect(page).to have_content "confirmed"
  end
end
