class RandomNumberGenerator

  def self.generate_random_key
    rand(100000).to_s.rjust(5, '00000')
  end

end
