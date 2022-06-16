class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_reader :label, :students

  def add_students(student)
    @students << student unless @students.include?(student)
    student.update_classroom(self) unless student.classroom == self
  end
end