class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :created_at, DateTime, required: true

  belongs_to :user, required: true

end
