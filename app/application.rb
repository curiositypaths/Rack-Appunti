class AppuntiApp
  def self.call(env)
    [ 200, { }, ['Welcome to your notebook'] ]
  end
end
