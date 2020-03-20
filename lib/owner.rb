class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat_instance| cat_instance.owner == self}
    end
  end

  def dogs
    Dog.all.select|dog_instance| dog_instance.owner == self}
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    # self.cats.each do |cat|
    #   cat.mood = 'nervous'
    #   cat.owner = nil
    # end

    # self.dogs.each do |dog|
    #   dog.mood = 'nervous'
    #   dog.owner = nil
    # end

    # pets = self.cats + self.dogs

    pets = self.cats.push(*self.dogs)

    pets.each do |pet|
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dogs, and #{self.cats.count} cats."
  end
end
