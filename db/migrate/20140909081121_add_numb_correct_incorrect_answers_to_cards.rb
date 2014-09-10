class AddNumbCorrectIncorrectAnswersToCards < ActiveRecord::Migration
  def change
    add_column :cards, :correct_answers_counter, :integer, default: 0
    add_column :cards, :incorrect_answers_counter, :integer, default: 0
  end
end
