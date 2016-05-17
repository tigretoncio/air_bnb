class AirBnb < Sinatra::Base

  post "/bookings/new" do
    booking = Booking.create(user: current_user,
                             space: Space.first(id: params[:space]),
                             date: params[:date])
    # if booking.id.nil?
    #   flash[:errors] = space.errors.full_messages
    #   redirect to "/spaces/new"
    # else
    #   redirect to "/spaces"
    # end
  end
end
