
# Testing
class TestController < ApplicationController
  before_action :authenticate_user!

  def settings
    @dictionaries = current_user.dictionaries.all
  end

  def start
    @count_of_questions = params[:count_of_questions].to_i
    # Сюда добавить проверку (чтобы id словарей соответствовали только данному пользователю)
    selected_dictionaries = params[:dict]
    selected_dictionaries.map! &:to_i
    array_words = []
    selected_dictionaries.each {|index| array_words += current_user.dictionaries.find(index).words.all}
    @questions = array_words.shuffle.take @count_of_questions
    # false - пользователь вводит английский эквивалент, true - русский
    @answers_languages = (1..@count_of_questions).to_a.map {[false, true].sample}
  end

  def result
    @answers = []
    @count_of_questions = params[:count_of_questions].to_i
    @answers_languages = params[:answers_languages].split(' ').map {|text| -> {return true if text == 'true'; false}.call}
    @questions = params[:questions].split(' ').map {|id| Word.find(id.to_i)}
    @count_of_questions.times {|index| @answers << params["answer_#{index}"]}
    @result = mark_factor(@answers, @answers_languages, @questions, @count_of_questions)
    @mark, @wrong_answers = (@result[:coefficient] * 100).round, @result[:wrong]
  end

  def mark_factor(answers, answers_language, questions, count_of_questions)
    index = 0
    wrong_answers = [] # Сюда заносим вопросы, на которые ответили неправильно
    right_answers = answers.count do |answer|
      result = false
      if answers_language[index] # Нужно узнать, проверяем мы русский или английский эквивалент слова
        # result = true означает, что пользователь правильно перевел слово
        if questions[index].russian.downcase == answer.downcase
          result = true
        else
          wrong_answers << {right: questions[index].russian.downcase, wrong: answer.downcase}
        end
      else
        if questions[index].english.downcase == answer.downcase
          result = true
        else
          wrong_answers << {right: questions[index].english.downcase, wrong: answer.downcase}
        end
      end
      index += 1
      result
    end
    # Возвращаем коэффициент "правильности" решения и массив неправильных ответов
    {coefficient: right_answers.to_d / count_of_questions, wrong: wrong_answers}
  end
end
