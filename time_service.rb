# frozen_string_literal: true

# module TimeService
module TimeService
  # create main class
  class TimeMain
    attr_accessor :hour, :minutes, :time_format, :min_output, :hour_output
    def initialize
      @hour = hour
      @minutes = minutes
      @time_format = time_format
      @min_const = 60
      @hour_const = 12
      @min_output = min_output
      @hour_output = hour_output
    end

    def parsing_time(add_time, add_minutes)
      value = add_time.split(/[: ]/)
      @hour = value[0].to_i
      @minutes = value[1].to_i
      @time_format = value[2]
      @minutes += add_minutes

      calculate_minut
      calculate_hour
      define_format if @hour_output >= 12
    end

    def calculate_minut
      if @minutes >= 60
        many_times = @minutes / @min_const
        @min_output = @minutes - @min_const * many_times
        @hour_output = @hour + many_times
      else
        @min_output = @minutes
        @hour_output = @hour
      end
    end

    def calculate_hour
      @hour_output = (@hour_output - @hour_const) if @hour_output > 12
    end

    def define_format
      case @time_format
      when 'AM' then @time_format = 'PM'
      when 'PM' then @time_format = 'AM'
      end
    end

    def output_time
      puts "#{@hour_output}:" \
      "#{@min_output < 10 ? "0#{@min_output}" : @min_output} #{@time_format}"
    end
  end

  # create time class
  class Time < TimeMain
    def add_minutes(time_in, minutes_in)
      parsing_time(time_in, minutes_in)
      output_time
    end
  end
end

TimeService::Time.new.add_minutes('9:10 AM', 175)
