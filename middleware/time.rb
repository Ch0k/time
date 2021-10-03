class Timer

  def initialize(app)
    @app = app
  end

  def call(env)
    @status, @headers, @body = @app.call(env)
    handle_request(env['REQUEST_PATH'], env['QUERY_STRING'])
  end

  private

  def handle_request(path, query)
    if path == "/time"
      query = query[6,50]
      str = ''
      data = query.split("%2C")
      unknow_time_format = []
      data.each do |data|
        if ["year","month","day","hour","minute","second"].none? { |n| data == n  }
          unknow_time_format << data
        else
          if data == "year"
            str = (Time.now.year.to_s + '-')
          elsif data == "month"
            str += (Time.now.month.to_s + '-') 
          elsif data == "day"
            str += (Time.now.day.to_s + '-')
          elsif data == "hour"
            str += (Time.now.hour.to_s + '-')
          elsif data == "minute"
            str += (Time.now.min.to_s + '-')
          elsif data == "second"
            str += (Time.now.sec.to_s + '-')
          end
        end
      end
      if unknow_time_format.empty?
        @status = 200 
        str = str[0...-1]
      else 
        @status = 400
        str = "Unknown time format #{unknow_time_format.to_s}"
      end
      [@status, @headers, ["#{str}"]]
    else
      path_not_allowed(path)
    end
  end

  def path_not_allowed(path)
    [404, {}, ["Path not allowed: #{path}"]]
  end

end


