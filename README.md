# StackOverflowExperiments
Purpose to explore stackoverflow problem in ruby-processing.

Upto JRuby-9.2.19.0 PiCrate, JRubyArt and propane sketches were running fine, since recent JRuby-9.3-SNAPSHOT calling size in a sketch (in settings) is causing stackoverflow. However `full_screen` and `default` sized sketches seem to to work. Processing PApplet is a complete bag of tricks suffering from a bad case of code rot and many fixes just to get things working on MacOS and or Windoes. So initial investigations will be with PiCrate (linux/RaspberryPI).

1. Demonstrate running sketches with `full_screen` or `default` size.

2. See if there is workaround for size (eg setting `width`, `height`, `render_mode` in ruby constructor.
