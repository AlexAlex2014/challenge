# frozen_string_literal: true

# module TimeService
module TimeService
  class TimeMain
    attr_accessor :hour, :minutes, :time_format
    def initialize
      @hour = hour
      @minutes = minutes
      @time_format = time_format
      # @time_format_am = AM
      # @time_format_pm = PM

    end

  end
  class Time < TimeMain
    def add_minutes(time_in, minutes_in)
      value = time_in.split(/[: ]+/)
      p @hour = value[0].to_i
      p @minutes = value[1].to_i
      p @time_format = value[2]

      p minutes_in + @minutes

      # [H] H: MM {AM | PM}

    end
  end
end

var = TimeService::Time.new.add_minutes('9:13 AM', 10)

 # p var
