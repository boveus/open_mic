require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test
  def test_joke_exists
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_instance_of Joke, joke
  end

  def test_joke_has_an_id_question_and_answer
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal 1, joke.id
    assert_equal "Why did the strawberry cross the road?", joke.question
    assert_equal "Because his mother was in a jam.", joke.answer
  end
end
