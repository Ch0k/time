class App
  
  def call(env)
    [status, headers, body]
  end

  private

  def status
    200
  end

  def headers
    {'Contex type' => 'text/plain'}
  end

  def body
    ["Welcone aboard\n"]
  end
end
