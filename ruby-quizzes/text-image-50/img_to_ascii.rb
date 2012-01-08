# Ruby Quiz #50 - Text Image (http://rubyquiz.com/quiz50.html)

# Read in an image
# Convert the img to grayscale (w/a maximum of 20 colors) which greatly reduces the unique number of binary forms to represent each pixel
# Note: This won't be true grayscale (256 colors) but we need to be able to represent it via text w/finite chars
# During conversion force possible RGB combinations to be no > 20 to match unique possible ascii chars below

require 'rubygems'
require 'rmagick'

include Magick

CHARACTERS = ['@', '-', '+', 'W', 'y', '#', '.', '*', '$', 't',
  'x', '^', '=', 'T', ':', '~', '`', ';', 'z', '?']

img = Image.read(ARGV[0]).first

width = height = 80
#Resize the img to fit in the terminal unless rows / columns are already less than new width/height
img.change_geometry("#{width}x#{height}>") { |cols, rows, img|
  img.resize!(cols, rows) if img.rows > height && img.columns > width
}

# Match colors to # of characters so each can be uniquely represented
# This will recolor the pixels in the img to be one of 20 shades of gray ie rgb for pixel will be equivalent
grayscale_version = img.quantize(CHARACTERS.size, Magick::GRAYColorspace).normalize
rgb_ascii_map, ascii_img = {}, ''

grayscale_version.view(0, 0, height=img.columns, width=img.rows) do |view|

  (0..view.height-1).each do |column|
    (0..view.width-1).each do |row|

      #Pick a value for the pixel ie pixel.red,green,blue as they are all the same in grayscale
      rgb_value = view[column][row].red
      ascii_char = rgb_ascii_map.fetch(rgb_value, nil)

      if ascii_char.nil?
        ascii = CHARACTERS.shift
        rgb_ascii_map[rgb_value] = ascii
      end

      #Make two chars wide to preserve aspect ratio better for various images
      ascii_img << rgb_ascii_map[rgb_value]
      ascii_img << rgb_ascii_map[rgb_value]
    end

    ascii_img << "\n"
  end

end

puts ascii_img
