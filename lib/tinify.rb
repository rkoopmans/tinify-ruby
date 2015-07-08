require "tinify/version"
require "tinify/error"

require "tinify/client"
require "tinify/result"
require "tinify/source"

require "thread"

module Tinify
  class << self
    attr_accessor :key
    attr_accessor :app_identifier
    attr_accessor :compression_count

    def from_file(path)
      Source.from_file(path)
    end

    def from_buffer(string)
      Source.from_buffer(string)
    end

    def validate!
      client.request(:post, "/shrink")
    rescue ClientError
      true
    end

    def reset!
      @key = nil
      @client = nil
    end

    @@mutex = Mutex.new

    def client
      raise AccountError.new("Provide an API key with Tinify.key = ...") unless @key
      return @client if @client
      @@mutex.synchronize do
        @client ||= Client.new(@key, @app_identifier).freeze
      end
    end
  end
end
