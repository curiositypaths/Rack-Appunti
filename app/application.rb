class AppuntiApp
  def self.call(env)
    request = Rack::Request.new env
    response = Rack::Response.new
    response.write 'Welcome to your notebook'
    response.finish
  end
end
