class ResultService
  def initialize(number_of_errors)
    if number_of_errors == 0
      flash[:success] = "0 error"
      card.update_review_date
    elsif number_of_errors == 1
      flash[:error] = "1 error"
    elsif number_of_errors == 2
      flash[:error] = "2 errors"
    elsif number_of_errors == 3
      flash[:error] = "3 errors"
    else number_of_errors == 4
      flash[:error] = "4 or more of errors"
    end
  end
end
