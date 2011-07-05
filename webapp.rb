
class Democracy < Sinatra::Application
  
  get "/" do
    haml :'om/om'
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
    
  end

end