class EjSeis
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    new_response = ''
    response.each { |l| new_response << changeLine(l) }
    headers['Content-Length'] = new_response.length.to_s
    [status, headers, [new_response]]
  end


  def changeLine(string)
  	string.chars.map do |a|
  		a =~ /\d/ ? 'X' : a
  	end.join
  end
end