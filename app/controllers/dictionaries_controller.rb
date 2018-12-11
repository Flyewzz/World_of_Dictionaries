# Dictionaries
class DictionariesController < ApplicationController
  before_action :set_dictionary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /dictionaries
  # GET /dictionaries.json
  def index
    @dictionaries = current_user.dictionaries.all
    @empty = @dictionaries.count.zero?
  end

  # GET /dictionaries/1
  # GET /dictionaries/1.json
  def show
    @words = Dictionary.find(params[:id]).words.all
    @empty = @words.count.zero?
    respond_to do |format|
      format.html
      format.json do
        render json: {'empty': @empty, 'table': create_words_table(@words)}
      end
    end
  end

  def create_words_table(words)
    result_table_string = "<table border='1' style='text-align:center'><thead><th>Русский</th><th>Английский</th></thead><tbody>"
    words.each {|word| result_table_string += "<tr><td>#{word.russian}</td><td>#{word.english}</td>"}
    result_table_string
  end

  # GET /dictionaries/new
  def new
    @dictionary = Dictionary.new
  end

  # GET /dictionaries/1/edit
  def edit
  end

  # POST /dictionaries
  # POST /dictionaries.json
  def create
    @dictionary = Dictionary.new(title: params[:dictionary][:title], user: current_user)

    respond_to do |format|
      if @dictionary.save
        format.html {redirect_to @dictionary, notice: 'Dictionary was successfully created.'}
        format.json {render :show, status: :created, location: @dictionary}
      else
        format.html {render :new}
        format.json {render json: @dictionary.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /dictionaries/1
  # PATCH/PUT /dictionaries/1.json
  def update
    respond_to do |format|
      if @dictionary.update(dictionary_params)
        format.html {redirect_to @dictionary, notice: 'Dictionary was successfully updated.'}
        format.json {render :show, status: :ok, location: @dictionary}
      else
        format.html {render :edit}
        format.json {render json: @dictionary.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /dictionaries/1
  # DELETE /dictionaries/1.json
  def destroy
    @dictionary.destroy
    respond_to do |format|
      format.html {redirect_to dictionaries_url, notice: 'Dictionary was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dictionary
    @dictionary = Dictionary.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dictionary_params
    params.require(:dictionary).permit(:title)
  end
end
