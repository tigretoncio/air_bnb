class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, Text, required: true
  property :description, Text, required: true
  property :price, Integer, required: true
  property :available_from, Date, required: true
  property :available_to, Date, required: true

  belongs_to :user, required: true


  def self.authenticate(params)
    available_from = ""
    if params[:available_from].length > 0 && Date.parse(params[:available_from]) > Date.today
      available_from = Date.today
    end
    space = create(user: params[:user],
                         name: params[:name],
                         description: params[:description],
                         price: params[:price],
                         available_from: params[:available_from],
                         available_to: params[:available_to])
  end

end
