feature "view spaces" do

  before do
    sign_up
    create_space
  end

  scenario "view list of spaces as the homepage" do
    visit "/"
    expect(page).to have_content "Amy's house"
  end

  scenario "view list of spaces" do
    params1= {name:"Amy's other house", description:"Amy's other house is also nice", price:"£40", available_from: Time.new(2016,5,25), available_to: Time.new(2016,5,30)}
    create_space(params1)
    visit "/spaces"
    expect(page).to have_content "Amy's house"
    expect(page).to have_content "Amy's other house"
  end

  scenario "view list of spaces in ascending price order" do
    params1= {name:"Amy's other house", description:"Amy's other house is also nice", price:"£20", available_from: Time.new(2016,5,25), available_to: Time.new(2016,5,30)}
    create_space(params1)
    first_space_index = page.body.index("Amy's house")
    second_space_index = page.body.index("Amy's other house")
    expect(first_space_index).to be > second_space_index
  end

  scenario "filtering spaces" do
    params1= {name:"Maria's other house", description:"Maria's other house is also nice", price:"£20", available_from: Time.new(2016,6,25), available_to: Time.new(2016,6,30)}
    create_space(params1)
    fill_in :available_from, with: Time.new(2016,6,26)
    fill_in :available_to, with: Time.new(2016,6,29)
    click_button 'List Spaces'
    expect(page).to have_content "Maria's other house"
    expect(page).not_to have_content "Amy's house"
  end

  scenario "viewing each space in more detail" do
    click_link "space#{Space.first.id}"
    expect(page).to have_content "Amy's house"
    expect(page).to have_content "Pick a night"
    expect(page).to have_css("form input#request")
    expect(page).to have_css("form input#date")
  end
end
