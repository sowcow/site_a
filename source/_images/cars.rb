require 'mini_magick'

files = %w[ bus.png truck.jpg semitrailer.png ]

dest = '../img/'

files.each { |file|
  image = MiniMagick::Image.open file
  image.path
  image.resize "329x"
  image.format "png"
  image.write "#{dest}#{ file.sub /.jpg$/, '.png' }"
}

resizes = {
  'truck.png' => '150x150',
  'bus.png'   => '200x200',
  'semitrailer.png' => '250x250'
}

Dir.chdir(dest) do
  #files = files.map { |x| x.sub /.jpg$/, '.png' }
  resizes.each { |file,size|
    system 'convert %s -resize %s -gravity north -extent 330x330 %s' %
      [file, size, file]

  }
end
