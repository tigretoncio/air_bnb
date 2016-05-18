class AirBnb < Sinatra::Base

  get "/bookings" do
    if current_user
      @bookings_made = Booking.all(user_id: current_user.id)
      current_user_spaces = Space.all(user_id: current_user.id)
      current_user_spaces_ids = current_user_spaces.map {|space| space.id}
      @bookings_received = Booking.all(space_id: current_user_spaces_ids)
      erb :"bookings/index"
    else
      redirect to "/sessions/new"
    end
  end

  post "/bookings/new" do
    booking = Booking.create(user: current_user,
                             space: Space.first(id: params[:space]),
                             date: params[:date],
                             status: "requested")
    if booking.id.nil?
      flash[:errors] = booking.errors.full_messages
    else
      redirect to "/bookings"
    end
  end

  get "/bookings/:id" do
    @booking = Booking.first(id: params[:id])
    @other_bookings = Booking.all(space_id: @booking.space.id,
                                  date: @booking.date) - @booking
    erb :"bookings/booking"
  end

  post "/bookings/:id/:status" do
    booking = Booking.first(id: params[:id])
    booking.update(status: params[:status])
    redirect to "/bookings"
  end
end
