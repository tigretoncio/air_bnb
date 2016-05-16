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
    params1= {name:"Amy's other house", description:"Amy's other house is also nice", price:"£40"}
    create_space(params1)
    visit "/spaces"
    expect(page).to have_content "Amy's house"
    expect(page).to have_content "Amy's other house"
  end

  scenario "view list of spaces in ascending price order" do
    params1= {name:"Amy's other house", description:"Amy's other house is also nice", price:"£20"}
    create_space(params1)
    first_space_index = page.body.index("Amy's house")
    second_space_index = page.body.index("Amy's other house")
    expect(first_space_index).to be > second_space_index
  end
end
