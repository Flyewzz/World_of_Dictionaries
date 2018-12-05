class TestController < ApplicationController
  before_action :authenticate_user!, except: []
  def settings
    @dictionaries = current_user.dictionaries.all
  end

  def start
    @count_of_questions = params[:count_of_questions].to_i
    # Сюда добавить проверку (чтобы id словарей соответствовали только данному пользователю)
    selected_dictionaries = params[:dict]
    selected_dictionaries.map! &:to_i
    array_words = []
    selected_dictionaries.each { |index| array_words += current_user.dictionaries.find(index).words.all }
    @questions = array_words.shuffle.take @count_of_questions
  end
  def next
    @current_question = 1
  end
  def result
  end
end
