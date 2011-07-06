
Ohm.connect

class Democracy < Sinatra::Application
  
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

  helpers do

    def partial(page, options={})
      haml page, options.merge!(:layout => false)
    end

    def md_partial(page, options={})
      (markdown page, options.merge!(:layout => false)).force_encoding('utf-8')
    end
    
    def authorized?
      rand > 0.5 ? true : false
    end

  end

end