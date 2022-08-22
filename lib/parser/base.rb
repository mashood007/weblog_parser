# frozen_string_literal: true

module Parser
  class Base
    attr_accessor :filename

    def initialize(filename:)
      @filename = filename
      @file = Parser::File.new(filename)
    end

    def call
      if @file.valid?
        web_server = Parser::WebServer.new(@file.lines)
        puts '=== Most Views ==='
        web_server.most_views
        puts '=== Most Unique Views ==='
        web_server.most_unique_views
      else
        p @file.errors
      end
    end
  end
end
