class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name, species = "human")
    @name = name 
    @species = species
    save
  end 
  
  def say_species
    "I am a #{@species}."
  end 
  
  def save
    @@all << self 
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
    Cat.all.select {|cats| cats.owner == self}
  end 
  
  def dogs 
    Dog.all.select {|dogs| dogs.owner == self}
  end 
  
  def buy_cat(cat)
    Cat.new(cat, self)
  end 
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end 
  
  def walk_dogs
    dogs.select {|dog| dog.mood = "happy"}
  end 
  
  def feed_cats
    cats.select {|cat| cat.mood = "happy"}
  end 
  
  def sell_pets
    all = cats + dogs 
    all.each {|pets| pets.mood = "nervous" pets.owner = nil}
    
  end 
end