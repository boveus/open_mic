class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    jokes << joke
  end

  def tell(user, joke)
    user.learn(joke)
  end
end
