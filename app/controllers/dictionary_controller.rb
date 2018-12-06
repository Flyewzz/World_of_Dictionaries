class DictionaryController < ApplicationController
  before_action :authenticate_user!, except: []

  def new
    rus = params[:russian]
    eng = params[:english]
    dictionary_id = params[:dictionary_id]
    @dictionaries = current_user.dictionaries.all
    @message = false
    @error = false
    @color = 'green'
    return if dictionary_id.nil?
    if current_user.dictionaries.find(dictionary_id).words.find_by_russian(rus) || current_user.dictionaries.find(dictionary_id).words.find_by_english(eng)
      @message = true
      @error = true
      @color = 'red'
    else
      unless rus.nil? || eng.nil? || dictionary_id.nil?
        current_user.dictionaries.find(dictionary_id).words.create(russian: rus, english: eng)
        @message = true
      end
    end
  end

  def add

  end

  def index
    @words = Word.where(dictionary: Dictionary.where(user: current_user))
    @empty = @words.count.zero?
  end

  def show
  end

  def destroy
    if word = Word.find(params[:id])
      word.delete
      flash[:notice] = 'Слово удалено!'
    else
      flash[:alert] = 'Ошибка удаления'
    end
    redirect_to '/dictionary/index'
  end

  def edit
  end

  def interactive
  end

  def clear

  end
end
