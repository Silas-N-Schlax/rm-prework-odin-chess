# Save and Load game
class SerializeGame
  def self.load
    path = File.join(__dir__, 'save.dat')
    return nil unless File.exist?(path)

    File.open(path, 'rb') do |file|
      Marshal.load(file)
    end
  end

  def self.save(game)
    File.binwrite(File.join(__dir__, 'save.dat'), Marshal.dump(game))
  end
end
