class Joke
  def initialize(joke)
    @joke = joke
  end

  def question
    @joke[:question]
  end

  def answer
    @joke[:answer]
  end

  def id
    @joke[:id]
  end
end
