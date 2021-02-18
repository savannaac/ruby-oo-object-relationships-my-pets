class Owner
    attr_reader :name, :species
    attr_accessor :cats, :dogs, :pets

    @@all = []
    @@pets = { :cats => [], :dogs => [] }

    def initialize(name)
      @name = name
      @species = "human"
      @@all << self
      @cats = []
      @dogs = []
    end

    def say_species
      "I am a #{@species}."
    end

    def self.all
      @@all
    end

    def self.count
      @@all.count
    end

    def self.reset_all
      @@all.clear
    end

    def cats
      Cat.all.select {|cat| cat.owner == self}
    end

    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end

    def buy_cat(name)
      cat = Cat.new(name)
      @cats << cat
    end

    def buy_dog(name)
      dog = dog.new(name)
      self.dogs << dog
      dog.owner = self
    end

    def walk_dogs
      dogs.each { |dog| dog.mood = "happy" }
    end

    def feed_cats
      cats.each { |cat| cat.mood = "happy" }
    end

    def sell_pets(pets)
      pets.each do |pet, owner|
        owner.map do |pet|
          pet.mood = "nervous"
        end
        owner.clear
      end
    end

    def list_pets
      "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
    end
end