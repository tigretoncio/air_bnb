module SessionHelpers
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

  def create_space(params = {name: "Amy's house",
                        description: "Amy's house is nice",
                        price: "£30"})
    visit "/spaces/new"
    fill_in :name, with: params[:name]
    fill_in :description, with: params[:description]
    fill_in :price, with: params[:price]
    click_button "Add space"
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
