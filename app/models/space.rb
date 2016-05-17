class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text, required: true
  property :description, Text, required: true
  property :price, Text, required: true
  property :available_from, Date, required: true
  property :available_to, Date, required: true

  belongs_to :user, required: true

end
