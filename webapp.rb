
Ohm.connect

class Democracy < Sinatra::Application
  
  get "/" do
    haml :agora
  end

  get "/about" do
    haml :about
  end
  
  get "/citizen/:id" do
    @citizen = Citizen[params[:id]]
    haml :citizen
  end

  get "/proposition/:id" do
    @proposition = Proposition[params[:id]]
    haml :proposition
  end
  
  get "/argument/:id" do
    redirect "/"
    # Identify the parent, redirect to parent and anchor!
  end

  get "/css/style.css" do
    content_type 'text/css', :charset  => 'utf-8'
    sass :style
  end

  helpers do

    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end
    
    def authorized?
      rand > 0.5 ? true : false
    end

  end

end