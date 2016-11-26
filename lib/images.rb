#!/usr/bin/env ruby

require 'cloudinary'
require 'open-uri'
require 'tempfile'
require 'uri'

class Images
  def initialize base, img
    @img = URI.join(base, img)
    @file = Tempfile.new('foo')
  end

  def work
    download
    upload['secure_url']
  end

  def download
    open(@img, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}) do |f|
      File.open(@file.path,"wb") do |file|
        file.puts f.read
      end
    end
  end

  def upload
    Cloudinary::Uploader.upload(@file.path)
  end
end
