class Movie < ActiveRecord::Base
def self.create_with_title(title)
    movie = self.new(title: title)
    movie.save
    movie
  end
  def self.first_movie
    self.first
  end
   def self.last_movie
    self.last
  end
  def self.movie_count
    self.count
  end
  def self.find_movie_with_id(id)
    self.find(id)
  end
  def self.find_movie_with_attributes(attribute)
    self.find_by(attribute)
  end
    def self.find_movies_after_2002
    Movie.where("release_date > ?", 2002)
  end
  
  def update_with_attributes(attributes)
    if attributes.is_a?(Hash)
      self.update(attributes)
    elsif attributes.is_a?(String)
      attribute_name, attribute_value = attributes.split(":")
      self.update(attribute_name.to_sym => attribute_value)
    end
  end
  
   def self.update_all_titles(title)
    self.update_all(title: title)
  end
  def self.delete_all_movies
    self.destroy_all
  end
  def self.delete_by_id(id)
    self.destroy(id)
  end
end