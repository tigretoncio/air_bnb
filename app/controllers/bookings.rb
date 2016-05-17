class AirBnb < Sinatra::Base

  get "/bookings" do
    @bookings_made = Booking.all(user_id: current_user.id)
    current_user_spaces = Space.all(user_id: current_user.id)
    current_user_spaces_ids = current_user_spaces.map {|space| space.id}
    @bookings_received = Booking.all(space_id: current_user_spaces_ids)
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
