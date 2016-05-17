class AirBnb < Sinatra::Base

  get "/bookings" do
    @bookings = Booking.all(user_id: current_user.id)


    spaces_I_own = Space.all(user_id: current_user.id)
    arr = []
    spaces_I_own.each do |space|
      arr << space.id
    end
    @bookings_received = Booking.all(space_id: arr)
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
