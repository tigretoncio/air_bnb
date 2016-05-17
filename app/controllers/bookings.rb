class AirBnb < Sinatra::Base

  get "/bookings" do
    @bookings = Booking.all
    erb :"bookings/index"
  end

  post "/bookings/new" do
    booking = Booking.create(user: current_user,
                             space: Space.first(id: params[:space]),
                             date: params[:date],
                             status: "Requested")
    if booking.id.nil?
      flash[:errors] = booking.errors.full_messages
    else
      redirect to "/bookings"
    end
  end
end
