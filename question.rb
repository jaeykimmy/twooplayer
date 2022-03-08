class Question 
  attr_accessor :number_one, :number_two, :answer
  
  def initialize()
    @number_one = rand(1...20)
    @number_two = rand(1...20)
    @answer = @number_one + @number_two
  end
 
  def generate_question 
    puts "What is #{@number_one} + #{@number_two}?"
  end

  def check_input(answer)
    answer == @answer
  end
end


# question_one = Question.new
# question_one.generate_question
# puts question_one.check_input(20)