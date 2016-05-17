feature "view booking" do

  scenario "view list of bookings" do
    create_booking
    click_button "Request to book"
    expect(page).to have_content "My Bookings"
  end

  scenario "view list of my bookings(as a customer)" do
    create_booking
    click_button "Request to book"
    expect(page).to have_content "@maria"
    expect(page).to have_content "Amy's house"
  end

  scenario "view list of bookings" do
    sign_up
    visit "/bookings"
    expect(page).to have_content "My Bookings"
  end

  scenario "view list of bookings receieved" do
    create_booking
    click_button "Request to book"
    logout
    login
    visit "/bookings"
    expect(page).to have_content "Maria"
    expect(page).to have_content "Amy's house"
    expect(page).to have_content "2016-05-30"
  end

  # scenario "view list of bookings in ascending date order" do
  #   params1= {date: Time.new(2016,5,25), status: "Requested", user: User.first}
  #   create_space(params1)
  #   first_space_index = page.body.index("Amy's house")
  #   second_space_index = page.body.index("Amy's other house")
  #   expect(first_space_index).to be > second_space_index
  # end
end
