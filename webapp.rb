# encoding: utf-8

Ohm.connect

require './mailer'
require './auth'

class Democracy < Sinatra::Application

  configure do
    #set :environment, ENV['DATABASE_URL'] ? :production : :development
    set :logging, true
    set :dump_errors, true
    use Rack::Session::Pool
  end
  
  get "/" do
    haml :agora
  end

  get "/citizen/:id" do
    @citizen = Citizen[params[:id]]
    haml :citizen
  end

  get "/proposition/:id" do
    @proposition = Proposition[params[:id]]
    haml :proposition
  end

  get "/create_proposition" do
    authorize!
    haml :proposition_create
  end

  post "/create_proposition" do
    authorize!
    p = params['proposition']
    p['citizen'] = session[:user]
    puts "this user is proposing: #{p['citizen']}"    
    created = Proposition.create p
    puts "created proposition: #{created.inspect}"
    unless created.valid?
      flash("Något gick fel - ditt förslag har inte sparats!", :error)
      @prop_title, @prop_text = p['title'], p['text']
      haml :create_proposition
    end
    redirect "/proposition/#{created.id}"
  end
  
  get "/argument/:id" do
    redirect "/"
    # Identify the parent, redirect to parent and anchor!
  end

  get "/css/style.css" do
    content_type 'text/css', :charset  => 'utf-8'
    sass :style
  end

  get "/om/:id" do
    haml :"om/#{params[:id]}"
  end

  get "/om/?" do
    haml :'om/om'
  end  

  error 404 do
    session[:flash_top] = flash("Sidan du angav kunde inte hittas (404).", :error)
    redirect "/"
  end

  helpers do

    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end

    def md_partial(page, options={})
      (markdown page, options.merge!(:layout => false)).force_encoding('utf-8')
    end
    
    # Usage: flash("Message", :type)
    # In template: - if session[:flash_top] = session.delete(:flash_top)
    #
    def flash(msg, type = :error)
      session[:flash_top] = "
        <div class='flash_#{type.to_s}'>
          #{type == :error ? '✘' : '✔' }
          &nbsp;
          #{msg}
        </div>"
    end

  end

end