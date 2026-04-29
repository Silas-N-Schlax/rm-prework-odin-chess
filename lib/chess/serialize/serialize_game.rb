# Save and Load game
class SerializeGame
  def self.load
    File.open(File.join(__dir__, 'save.dat'), 'rb') do |file|
      Marshal.load(file)
    end
  end

  def self.save(game)
    File.binwrite(File.join(__dir__, 'save.dat'), Marshal.dump(game))
  end
end
