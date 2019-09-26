require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )

class Transaction

  attr_reader :id
  attr_accessor :user_id, :merchant_id, :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @amount = options['amount'].to_i
  end

end
