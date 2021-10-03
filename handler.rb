require 'rack'

app = Proc.new do |env|
  [
    200,
    {'Contex type' => 'text/plain'},
    ["Welcone aboard\n"]
  ]
end

Rack::Handler::WEBrick.run app

