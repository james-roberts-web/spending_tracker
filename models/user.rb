require( 'sinatra' )
require( 'sinatra/reloader' )
require( 'pry' )

require_relative('../db/sql_runner.rb')
require_relative('./category')
require_relative('./merchant')
require_relative('./transaction')
require_relative('./user')

class User

  attr_reader :id
  attr_accessor :user_name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_name = options['user_name']
    @funds = options['funds'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM users WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def save
    sql = "INSERT INTO users (user_name, funds)
    VALUES ($1, $2) RETURNING id"
    values = [@user_name, @funds]
    arr = SqlRunner.run(sql, values).first
    @id = arr['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM users"
    values = SqlRunner.run(sql)
    result = values.map { | users | User.new(users) }
    return result
  end

  def update
    sql = "UPDATE users
    SET user_name = $1, funds = $2 WHERE id = $3"
    values = [@user_name, @funds]
    SqlRunner.run(sql, values)
  end

  def read
    sql = "SELECT * FROM users WHERE id = $1"
    values = [@id]
    arr = SqlRunner.run(sql, values)
    return arr.map{|users|User.new(users)}
  end

end
