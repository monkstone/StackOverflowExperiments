require_relative 'test_helper'

Dir.chdir(File.dirname(__FILE__))

# Sketch tests
class RunTest < Minitest::Test
  def test_default_size
    out, _err = capture_io do
      Kernel.open('|jruby sketches/default_tree.rb', 'r') do |io|
        while (l = io.gets)
          puts(l.chop)
        end
      end
    end
  end

  def test_fullscreen
    out, _err = capture_io do
      Kernel.open('|jruby sketches/full_screen.rb', 'r') do |io|
        while (l = io.gets)
          puts(l.chop)
        end
      end
    end
  end
end
