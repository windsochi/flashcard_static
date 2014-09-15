class ResultService
  def initialize(number_of_errors)
    if number_of_errors == 0
      puts "0 error"
      card.update_review_date
    elsif number_of_errors == 1
      puts "1 error"
    elsif number_of_errors == 2
      puts "2 errors"
    elsif number_of_errors == 3
      puts "3 errors"
    else number_of_errors == 4
      puts "4 or more of errors"
    end
  end
end
