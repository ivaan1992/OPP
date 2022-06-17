require_relative './decorator'
require_relative './rental'

class Person
  include Decorator

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
    return true if of_age? || @parent_permission == true

    false
  end

  def correct_name
    decorated_name(@name)
  end

  def add_rental(date, book)
    @rentals << Rental.new(book, self, date)
  end

  private

  def of_age?
    return true if @age >= 18
    
    false
  end
end
