require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )

require_relative('../db/sql_runner.rb')
require_relative('./category')
require_relative('./merchant')
require_relative('./transaction')
require_relative('./user')

class Transaction

  attr_reader :id
  attr_accessor :user_id, :merchant_id, :category_id, :transaction_time, :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @transaction_time = options['transaction_time']
    @amount = options['amount'].to_i
  end

  def save
    sql = "INSERT INTO transactions (user_id, merchant_id, category_id, transaction_time, amount)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@user_id, @merchant_id, @category_id, @transaction_time, @amount]
    arr = SqlRunner.run(sql, values).first
    @id = arr['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions"
    values = SqlRunner.run(sql)
    result = values.map {|transactions|Transaction.new(transactions)}
    return result
  end

  def read
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [@id]
    arr = SqlRunner.run(sql, values)
    return arr.map{|transactions|Transaction.new(transactions)}
  end

end
