class AddNumbCorrectIncorrectAnswersToCards < ActiveRecord::Migration
  def change
    add_column :cards, :number_correct_answers, :integer, default: 0
    add_column :cards, :number_incorrect_answers, :integer, default: 0
  end
end
