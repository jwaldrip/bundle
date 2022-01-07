require "digest/sha512"
require "base64"
require "compress/zip"
require "file_utils"

module Cryostasis
  Log = ::Log.for("cryostasis")

  macro preserve(glob)
    str = "{{ run "./preserve.cr", glob }}"
    io = IO::Memory.new(Base64.decode_string(str))
    Compress::Zip::Reader.open(io, true) do |zip|
      zip.each_entry do |entry|
        case entry
        when .file?
          Log.info { "Restoring #{entry.filename}"}
          FileUtils.mkdir_p File.dirname(entry.filename)
          File.write(entry.filename, entry.io)
        when .dir?
          FileUtils.mkdir_p entry.filename
        end
      end
    end
  end
end
