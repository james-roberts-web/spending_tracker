require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )

class User

  attr_reader :id
  attr_accessor :user_name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_name = options['user_name']
    @funds = options['funds'].to_i
  end

end
