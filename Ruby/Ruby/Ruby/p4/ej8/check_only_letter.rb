class CheckOnlyLetter
  def initialize(app)
    @app = app
  end

  def debug(env)
	status, headers, response = @app.call(env)
	new_response = ''
    new_response = response.join + env.inspect
    headers['Content-Length'] = new_response.length.to_s
    [status, headers, [new_response]]
  end
  def call(env)
  	if env["REQUEST_URI"] =~ /partida\/\d/ and env["REQUEST_METHOD"] == "PUT"
		input = env["rack.request.form_hash"]["attempt"]
		if input =~ /^[a-zA-Z]$/ 
			status, headers, response = @app.call(env)
		    [status, headers, response]
		else
			[400, {}, [Templates.render('msg',['Ingres&aacute; solo una letra.'])]]
		end
	else
		status, headers, response = @app.call(env)
		[status, headers, response]
	end
  end

end