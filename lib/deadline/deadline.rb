module Deadline

  class Deadline

    @@default_duration = 1

    def self.default_duration
      @@default_duration
    end

    def self.default_duration=(default_duration)
      @@default_duration = Float(default_duration)
    end

    attr_reader :duration, :start_time

    def initialize(duration = Deadline.default_duration)
      @duration = Float(duration)
      @start_time = nil
    end

    def start
      raise "Already started" unless @start_time.nil?
      @start_time = Time.now.utc
      self
    end

    def started?
      !@start_time.nil?
    end

    def time_left
      if started?
        duration - (Time.now.utc - start_time)
      else
        nil
      end
    end

    def expired?
      expired = started? && (time_left <= 0)
    end

  end

end
