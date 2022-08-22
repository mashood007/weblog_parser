#!/usr/bin/env ruby
# frozen_string_literal: true

require './config/environment'
# require "pry"

def main
  parser = Parser::Base.new(filename: ARGV[0])
  parser.call
end

main

# need comments for all---------------------
