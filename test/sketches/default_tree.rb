#!/usr/bin/env jruby -w

# frozen_string_literal: true
require 'picrate'

TIME_FORMAT = 'Time after this iteration: %.2f'

class Tree < Processing::App
  # http://processing.org/learning/topics/tree.html
  # by Joe Holt

  def setup
    sketch_title 'Tree'
    color_mode RGB, 1
    frame_rate 30
    @x = 0.0
    @dx = width / 100
    @start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @frame_time = nil
  end

  def draw
    t = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    if @frame_time
      fps = 1.0 / (t - @frame_time)
      # printf "%0.1f fps\n", fps
    end
    @frame_time = t

    background 0
    stroke 1, 1, 1
    # Let's pick an angle 0 to 90 degrees based on the mouse position
    a = (@x / width) * 90
    # Convert it to radians
    @theta = a.radians
    # Start the tree from the bottom of the screen
    translate(width / 2, height)
    # Draw a line 60 pixels
    h = height / 3
    line(0, 0, 0,  -h)
    # Move to the end of that line
    translate(0, -h)
    # Start the recursive branching!
    branch(h)

    @x += @dx
    if @x < 0
      puts format(TIME_FORMAT, t - @start_time)
    end
    if @x > width || @x < 0
      @dx = - @dx
      @x += @dx * 2
    end
    exit if frame_count > 200
  end

  def branch(h)
    # Each branch will be 2/3rds the size of the previous one
    h *= 0.66
    # All recursive functions must have an exit condition!!!!
    # Here, ours is when the length of the branch is 2 pixels or less
    if h > 2
      push_matrix       # Save the current state of transformation (i.e. where are we now)
      rotate(@theta)   # Rotate by theta
      line(0, 0, 0, -h)   # Draw the branch
      translate(0, -h)  # Move to the end of the branch
      branch(h)        # Ok, now call myself to draw two new branches!!
      pop_matrix        # Whenever we get back here, we "pop" in order to restore the previous matrix state

      # Repeat the same thing, only branch off to the "left" this time!
      push_matrix
      rotate(-@theta)
      line(0, 0, 0, -h)
      translate(0, -h)
      branch(h)
      pop_matrix
    end
  end
end

Tree.new
