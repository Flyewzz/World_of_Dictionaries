require 'test_helper'

class DictionaryTest < ActiveSupport::TestCase

  test "not nil or empty" do
    user = User.find_by_email('test@mail.ru')
    dictionary1 = Dictionary.new(title: nil, user: user)
    assert_not dictionary1.save
    dictionary2 = Dictionary.new(title: '', user: user)
    assert_not dictionary2.save
  end

  test "lengths test" do
    user = User.find_by_email('test@mail.ru')
    title = 'a' * 61
    dictionary = Dictionary.new(title: title, user: user)
    assert_not dictionary.save
    title = 'a' * 20 # 20 - correct length for title
    dictionary_correct = Dictionary.new(title: title, user: user)
    assert dictionary_correct.save
  end

  test "add and remove dictionary" do
    user = User.find_by_email('test@mail.ru')
    dictionary = Dictionary.create(title: 'test', user: user)
    assert_equal 1, user.dictionaries.count
    # removing
    dictionary.delete
    assert user.dictionaries.count.zero?
  end

  # Тест, определяющий правильность валидации слов
  test "only correct dictionaries" do
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
    obj_correct = Word.new(russian: 'рус', english: 'eng', dictionary: test_dictionary)
    assert obj_correct.save
  end

end
