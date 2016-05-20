require 'mailgun'
class AirBnb < Sinatra::Base

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.id.nil?
      flash[:errors] = user.errors.full_messages
    else
      session[:user_id] = user.id
      #SendSignupAck.call(user)
    end
    redirect to "/spaces"
  end

  get "/users/password_recovery" do
    erb :"users/password_recovery"
  end

  post "/users/password" do
    user = User.first(email: params[:email])
    if user
      user.store_token
      #SendRecoverLink.call(user)
    end
    flash[:errors] = ["Please check your emails"]
    redirect to "/spaces"
  end

  get "/users/password_reset" do
    if User.find_by_token(params[:token])
      erb :"users/password_reset"
    else
      flash[:errors] = ["Invalid password token"]
      redirect to "/spaces"
    end
  end

  patch "/users" do
    user = User.find_by_token(params[:token])
    if user.update(password: params[:password],
                   password_confirmation: params[:password_confirmation])
       redirect to "/sessions/new"
    else
      flash[:errors] = ["Password does not match the confirmation"]
      redirect to "/spaces"
    end
  end
end
