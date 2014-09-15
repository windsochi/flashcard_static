class ResultService
  def initialize(translation, translated_text)
    case Text::Levenshtein.distance(translation, translated_text)
    when 1
      flash[:error] = "1 error"
    when 2
      flash[:error] = "2 errors"
    when 3
      flash[:error] = "3 errors"
    when 4..15
      flash[:error] = "More error"
  end
end
