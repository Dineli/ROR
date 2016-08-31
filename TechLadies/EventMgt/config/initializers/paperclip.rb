 require 'paperclip/media_type_spoof_detector'

	module Paperclip
  		class MediaTypeSpoofDetector
    		def spoofed?
      			false
    		end
  		end
	end

  Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.9.5-Q8'
  Paperclip.options[:content_type_mappings] = { jpeg: 'image/jpeg', jpg: 'image/jpeg' } 

