require 'CSV'
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

  def perform_routine_for(user)
    @jokes.each do |joke|
      user.learn(joke)
    end
  end

  def learn_routine(jokes)
    data = CSV.read("./data/joke.csv", { encoding: "UTF-8", quote_char: "\x00", headers: true, header_converters: :symbol, converters: :all})
    hashed_data = data.map { |d| d.to_hash }
    hashed_data.each do |joke|
      joke[:question] = joke[:question].gsub("\\\" \\\\", "")
      joke[:answer] = joke[:answer].gsub("\\\" \\\\", "")
      learn(joke)
    end
  end
end
