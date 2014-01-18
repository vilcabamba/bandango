class Emisor < ActiveRecord::Base
  module ImagenUploadable
    extend ActiveSupport::Concern

    def imagen_url=(url)
      if data = split_base64(url)
        io = FilelessIO.new Base64.decode64(data[:data])
        io.original_filename = "img.#{data[:extension]}"
        self.imagen = io
      end
    end
    def split_base64(uri)
      if uri.match(%r{^data:(.*?);(.*?),(.*)$})
        return {
          type:      $1, # "image/png"
          encoder:   $2, # "base64"
          data:      $3, # data string
          extension: $1.split('/')[1] # "png"
          }
      end
    end
  end
end
