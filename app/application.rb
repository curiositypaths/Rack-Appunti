class AppuntiApp

  def initialize_request_and_response(env)
    @request = Rack::Request.new env
    @response = Rack::Response.new
  end

  def erb(template)
    path = File.expand_path("#{template}")
    ERB.new(File.read(path)).result(binding)
  end

  def render(template)
    @response.write erb template
    @response.finish
  end

  def call(env)
    initialize_request_and_response(env)
    @app_name = 'notebook'
    render "index.html.erb"
  end
end
