require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )

class Merchant

  attr_reader :id
  attr_accessor :merchant_name, :category

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
    @category = options['category']
  end

end
