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

  # scenario "view list of spaces in reverse chronological order" do
  #   Timecop.travel(60) do
  #     create_space("My second space")
  #     first_space_index = page.body.index("My first space")
  #     second_space_index = page.body.index("My second space")
  #     expect(first_space_index).to be > second_space_index
  #   end
  # end
end
