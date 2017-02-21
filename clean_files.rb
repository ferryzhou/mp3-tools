require 'fileutils'

# This program clean filenames.

# 'wang-jian-guo-20160515-32.mp3' -> 'wang-jian-guo-20160515.mp3'
# 'Wang_Jian_Guo_20160306.mp3' -> 'wang-jian-guo-20160306.mp3'
# 'wang-jian-guo-20160103.mp3' -> 'wang-jian-guo-20160103.mp3'
def get_normalized_name(filename)
  f = filename.gsub("Wang_Jian_Guo_", "wang-jian-guo-")
  f.gsub("-32.mp3", ".mp3")
end

# First copy raw downloaded files to INPUT_DIR
INPUT_DIR = 'data/raw'
OUTPUT_DIR = 'data/cleaned'
FileUtils.mkdir_p(OUTPUT_DIR)
Dir.glob(INPUT_DIR + '/*.mp3') do |f|
  # do work on files ending in .rb in the desired directory
  filename = File.basename(f)
  new_path = File.join(OUTPUT_DIR, get_normalized_name(filename))
  p "#{f} -> #{new_path}"
  FileUtils.cp(f, new_path)
end
