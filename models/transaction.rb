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
  attr_accessor :user_id, :merchant_id, :category_id, :transaction_date, :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @category_id = options['category_id'].to_i
    @transaction_date = options['transaction_date']
    @amount = options['amount'].to_i
  end

  def save
    sql = "INSERT INTO transactions (user_id, merchant_id, category_id, transaction_date, amount)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@user_id, @merchant_id, @category_id, @transaction_date, @amount]
    arr = SqlRunner.run(sql, values).first
    @id = arr['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM transactions"
    values = SqlRunner.run(sql)
    result = values.map {|transactions|Transaction.new(transactions)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE transactions
    SET (user_id, amount, transaction_date, merchant_id, category_id)
    VALUES ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@user_id, @amount, @transaction_date, @merchant_id, @category_id, @id]
    SqlRunner.run(sql, values)
  end

  def read
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [@id]
    arr = SqlRunner.run(sql, values)
    return arr.map{|transactions|Transaction.new(transactions)}
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    transaction = Transaction.new(result)
    return transaction
  end

  def find_merchant_name
    sql = "SELECT merchant_name FROM merchants
    INNER JOIN transactions
    ON transactions.merchant_id = merchants.id
    WHERE transactions.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result
  end

  def name
    sql = "SELECT merchant_name FROM merchants
    INNER JOIN transactions
    ON transactions.merchant_id = merchants.id
    WHERE transactions.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first['merchant_name']
    return result
  end

  def type
    sql = "SELECT transaction_type FROM categories
    INNER JOIN transactions
    ON transactions.category_id = categories.id
    WHERE transactions.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first['transaction_type']
    return result
  end

  def self.total_amount
    sql = "SELECT SUM(amount) FROM transactions"
    hash = SqlRunner.run(sql)
    amount = hash.first["sum"]
    return amount
  end

  def self.search_by_date(params)
    sql = "SELECT * FROM transactions WHERE transaction_date BETWEEN '#{params[:start_date]}' AND '#{params[:end_date]}' "
    result = SqlRunner.run(sql)
    return result.map {|transactions|Transaction.new(transactions)}
  end

  def self.search_by_category(params)
    sql = "SELECT * FROM transactions WHERE category_id = '#{params[:category_id]}'"
    result = SqlRunner.run(sql)
    return result.map {|transactions|Transaction.new(transactions)}
  end
  
end
