module TranslationResultHelper
  def translation_result(result)
    "В слове найдено ошибок: #{result[:number_of_errors]}."
  end
end
