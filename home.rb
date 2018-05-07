module Home
  def self.registered(app)
    # show_secrets = lambda do
    #   erb :index
    # end

    app.get  '/' do
      erb :index
    end
  end
end