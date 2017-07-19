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

end

#
# > require './lib/joke'
# # => true
#
# > joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
# # => #<Joke:0x007fc87b02c2e0 ...>
#
# > joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
# # => #<Joke:0x007fc87b135240 ...>
#
# > require './lib/user'
# # => true
#
# > ilana = User.new("Ilana")
# # => #<User:0x007fc87c8f8aa8 ...>
#
# > josh = User.new("Josh")
# # => #<User:0x007fc87cabfbe8 ...>
#
# > ilana.learn(joke_1)
# > ilana.learn(joke_2)
# > ilana.perform_routine_for(josh)
# > josh.jokes
# # => [#<Joke:0x007fc87b02c2e0 ...>, #<Joke:0x007fc87b135240 ...>]
#
# > josh.jokes.count
# # => 2
