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
end


# > require './lib/joke'
# # => true
#
# > joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
# # => #<Joke:0x007fc87b02c2e0 ...>
#
# > require './lib/user'
# # => true
#
# > sal = User.new("Sal")
# # => #<User:0x007fc87c8f8aa8 ...>
#
# > sal.jokes
# # => []
#
# > sal.learn(joke)
# > sal.jokes
# # => [#<Joke:0x007fc87b02c2e0 ...>]
