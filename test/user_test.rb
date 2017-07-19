require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_user_has_no_jokes_by_default
    sal = User.new("Sal")

    assert_equal 0, sal.jokes.count
  end

  def test_user_can_learn_a_joke
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_equal 1, sal.jokes.count
  end

  def test_user_can_tell_another_user_a_joke
    sal = User.new("Sal")
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)
    ali = User.new("Ali")
    sal.tell(ali, joke)

    assert_equal 1, ali.jokes.count
  end

  def test_user_can_perform_routine_for_another_user
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana = User.new("Ilana")
    josh = User.new("Josh")
    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)

    assert_equal 2, josh.jokes.count
  end

  def test_user_can_learn_routine_with_single_joke
    casey = User.new("Casey")
    casey.learn_routine('./data/joke.csv')

    assert_equal 1, casey.jokes.count
  end

  def test_user_can_learn_routine_with_two_jokes
    casey = User.new("Casey")
    casey.learn_routine('./data/jokes.csv')
  end

  def test_user_routine_jokes_are_properly_formatted
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    casey = User.new("Casey")
    casey.learn_routine('./data/jokes.csv')

    assert_equal joke_1, casey.jokes[0]
    assert_equal joke_2, casey.jokes[1]
  end
end

# > require './lib/user'
# # => true
#
# > casey = User.new("Casey")
# # => #<User:0x007fc87c8f8aa8 ...>
#
# > casey.learn_routine('./jokes.csv')
# > casey.jokes.count
# # => 100
