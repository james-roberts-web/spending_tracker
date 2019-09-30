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

  def self.delete_all
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM catagories WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def save
    sql = "INSERT INTO categories (transaction_type)
    VALUES ($1) RETURNING id"
    values = [@transaction_type]
    arr = SqlRunner.run(sql, values).first
    @id = arr['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM categories"
    values = SqlRunner.run(sql)
    result = values.map { | categories | Category.new(categories) }
    return result
  end

  def read
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@id]
    arr = SqlRunner.run(sql, values)
    return arr.map{| categories | Category.new(categories)}
  end

  def update
    sql = "UPDATE categories
    SET transaction_type = $1 WHERE id = $2"
    values = [@transaction_type]
    SqlRunner.run(sql, values)
  end



end
