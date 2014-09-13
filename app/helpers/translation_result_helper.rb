module TranslationResultHelper
  def translation_result(result)
    "<div class=#{result[:class]}>В слове найдено ошибок: #{result[:number_of_errors]}</div>" if result
  end
end
