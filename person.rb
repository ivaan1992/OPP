require './nameable'
require './capitalizer'
require './trimmer'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :age, :name, :rentals

  def can_use_services?
    of_age || @parent_permission
  end

  def correct_name
    decorated_name(@name)
  end

  def add_rental(date, book)
    Rental.new(book, self, date)
  end

  private

  def of_age?
    @age > 18
  end
end
