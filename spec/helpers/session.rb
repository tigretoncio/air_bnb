module SessionHelpers

  def create_space(params = {name: "Amy's house",
                             description: "Amy's house is nice",
                             price: "£30",
                             available_from: Time.new(2016,5,25),
                             available_to: Time.new(2016,5,30)})
    visit "/spaces/new"
    fill_in :name, with: params[:name]
    fill_in :description, with: params[:description]
    fill_in :price, with: params[:price]
    fill_in :available_from, with: params[:available_from]
    fill_in :available_to, with: params[:available_to]
    click_button "Add space"
  end

  def pre_create_booking
    sign_up
    create_space
    logout
    params = {name: "Maria",
              username: "maria",
              email: "maria@gmail.com",
              password: "marias_password",
              password_confirmation: "marias_password"}
    sign_up(params)
  end

  def create_booking(date = Time.new(2016,5,30))
    visit "/spaces"
    click_link "space#{Space.first.id}"
    fill_in :date, with: date
    click_button "Request to book"
  end

  def sign_up(params = {name: "Amy",
                        username: "amynic",
                        email: "amy@gmail.com",
                        password: "my_password",
                        password_confirmation: "my_password"})

    visit("/users/new")
    fill_in :name, with: params[:name]
    fill_in :username, with: params[:username]
    fill_in :email, with: params[:email]
    fill_in :password, with: params[:password]
    fill_in :password_confirmation, with: params[:password_confirmation]
    click_button "Sign up"
  end

  def login(params = { email: "amy@gmail.com",
                       password: "my_password"})
    visit "/sessions/new"
    fill_in :emailLogin, with: params[:email]
    fill_in :passwordLogin, with: params[:password]
    click_button "Login"
  end

  def logout
    click_link "Logout"
  end

  def request_reset_password(email = "amy@gmail.com")
    visit "/users/password_recovery"
    fill_in :email, with: email
    click_button "Reset"
  end

  def update_password(params = { password: "my_new_password",
                                 password_confirmation: "my_new_password"})
    visit ("/users/password_reset?token=#{User.first.password_token}")
    fill_in :password, with: params[:password]
    fill_in :password_confirmation, with: params[:password_confirmation]
    click_button "Update"
  end
end
