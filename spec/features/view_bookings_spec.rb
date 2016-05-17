feature "view booking" do

  before do
    sign_up
    create_space
  end

  scenario "view list of bookings" do
    visit "/bookings"
    expect(page).to have_content "Amy's house"
  end

  scenario "view list of bookings" do
    visit "/spaces"
    expect(page).to have_content "Amy's house"
    expect(page).to have_content "Amy's other house"
  end

  scenario "view list of bookings in ascending date order" do
    params1= {date: Time.new(2016,5,25), status: "Requested", user: User.first}
    create_space(params1)
    first_space_index = page.body.index("Amy's house")
    second_space_index = page.body.index("Amy's other house")
    expect(first_space_index).to be > second_space_index
  end
end
