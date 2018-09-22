class EjSiete
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    tot = 0
    response.each { |l| tot+= l.count('X') }
    headers['X-Xs-Count'] = tot.to_s
    [status, headers, response]
  end

end