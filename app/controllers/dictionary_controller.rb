class DictionaryController < ApplicationController
  def new
    rus = params[:russian]
    eng = params[:english]
    @message = false
    @error = false
    @color = 'green'
    if Word.find_by_russian(rus) || Word.find_by_english(eng)
      @error = true
      @color = 'red'
    else
      Word.create russian: rus, english: eng
    end
  end

  def add
    
  end

  def index
    @words = Word.all
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
