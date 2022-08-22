# frozen_string_literal: true

module Parser
  # The object of this class will represents the log file
  class File
    attr_accessor :filename, :lines

    def initialize(filename)
      @filename = filename
      @lines = read_file
    end

    def read_file
      IO.readlines(filename)
    rescue StandardError => e
      errors.push(e)
    end

    def errors
      @errors ||= []
    end

    def valid?
      errors.empty?
    end
  end
end
