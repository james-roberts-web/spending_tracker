require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )

require_relative('../db/sql_runner.rb')
require_relative('./category')
require_relative('./merchant')
require_relative('./transaction')
require_relative('./user')

class Merchant

  attr_reader :id
  attr_accessor :merchant_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end

  def save
    sql = "INSERT INTO merchants (merchant_name)
    VALUES ($1) RETURNING id"
    values = [@merchant_name]
    arr = SqlRunner.run(sql, values).first
    @id = arr['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM merchants"
    values = SqlRunner.run(sql)
    result = values.map {|merchants|Merchant.new(merchants)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE merchants
    SET merchant_name = $1 WHERE id = $2"
    values = [@merchant_name, @id]
    SqlRunner.run(sql, values)
  end

  def read
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@id]
    arr = SqlRunner.run(sql, values)
    return arr.map{|merchants|Merchant.new(merchants)}
  end

  def self.find(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    merchant = Merchant.new(result)
    return merchant
  end

  def delete
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



end
