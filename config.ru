
require 'rubygems'
require 'sinatra'

class Foo < Sinatra::Application
  get "/" do
    "DD"
  end
end

run Foo