class MoL
  def initialize(app)
    @app = app
  end

  def call(env)
    status = rand(1..42) == 42 ? 404 : 200
    [status, {}, []]
  end

end