class AppuntiApp

  # Layout rendering methods
  def prepare_page_layout
    layout_path = File.expand_path("app/views/layout.html.erb")
    ERB.new(File.read(layout_path)).result(binding)
  end

  def prepare_action_layout(template)
    template_path = File.expand_path("app/views/#{template}.html.erb")
    action_layout = ERB.new(File.read(template_path)).result(binding)
    prepare_page_layout {action_layout}
  end

  def render(template)
    @response.write prepare_action_layout template
    @response.finish
  end

  # Rack response handling methods
  def initialize_request_and_response(env)
    @request = Rack::Request.new env
    @response = Rack::Response.new
  end

  def call(env)
    initialize_request_and_response(env)
    route_response
  end

  # Application logic methods
  def route_response
    @app_name = 'Notebook'
    render 'index'
  end

end
