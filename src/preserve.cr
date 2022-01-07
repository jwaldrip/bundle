require "log"
require "compress/zip"
require "base64"

files = Dir.glob(ARGV[0])
raw = String.build do |io|
  Compress::Zip::Writer.open(io) do |zip|
    files.each do |file|
      unless Dir.exists?(file)
        zip.add(file, File.open(file))
      end
    end
  end
end

Base64.encode(raw, STDOUT)
