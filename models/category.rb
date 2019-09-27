require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )

require_relative('../db/sql_runner.rb')
require_relative('./category')
require_relative('./merchant')
require_relative('./transaction')
require_relative('./user')

class Category

  attr_reader :id
  attr_accessor :transaction_type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @transaction_type = options['transaction_type']
  end

end
