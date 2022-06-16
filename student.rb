require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  attr_reader :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end

  def update_classroom(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
