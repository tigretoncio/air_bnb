feature "view booking" do

  scenario "view list of bookings via 'Bookings' link at top of page" do
    sign_up
    visit "/bookings"
    expect(page).to have_content "My Bookings"
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

end
