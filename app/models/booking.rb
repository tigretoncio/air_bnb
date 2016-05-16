class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, Date, required: true
  #property:check_in, check_out is next functionality to implement

  belongs_to :user, required: true
  belongs_to :space, required: true

end
