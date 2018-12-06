require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "add and remove word" do
    user = User.find_by_email('test@mail.ru')
    dictionary = user.dictionaries.create(title: 'Title')
    word = dictionary.words.create(russian: 'рус', english: 'eng')
    assert_equal 1, dictionary.words.count
    # removing
    word.delete
    assert dictionary.words.count.zero?
  end

  # Тест, определяющий правильность валидации слов
  test "only correct words" do
    test_user = User.find_by_email('test@mail.ru')
    test_dictionary = Dictionary.create(title: 'Test', user: test_user)
    obj1 = Word.new(russian: nil, english: 'eng', dictionary: test_dictionary)
    assert_not obj1.save
    obj2 = Word.new(russian: 'rus', english: nil, dictionary: test_dictionary)
    assert_not obj2.save
    obj3 = Word.new(russian: nil, english: nil, dictionary: test_dictionary)
    assert_not obj3.save
    obj4 = Word.new(russian: '', english: '56', dictionary: test_dictionary)
    assert_not obj4.save
    obj_right = Word.new(russian: 'рус', english: 'eng', dictionary: test_dictionary)
    assert obj_right.save
  end
end
