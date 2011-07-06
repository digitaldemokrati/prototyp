# encoding: utf-8

class Democracy < Sinatra::Application

  helpers do

    def authorized?(realm=nil)
      return false unless session[:user]
      realm ? session[:user].may?(realm) : true
    end

    def authorize!(realm=nil)
      unless authorized?
        session[:flash_top] = flash("Du är inte inloggad! Ange giltigt användarnamn och lösenord.", :error)
        redirect '/'
      end

      unless session[:user].may? realm
        session[:flash_top] = flash("Du har inte rättigheter för den eftersökta sidan.", :error)
        redirect '/'
      end
    end

    def logout!
      session[:user] = nil
    end

  end


  ## Loggin in and out
  ####################
  
  get "/quick_and_dirty_login" do
    session[:user] = Citizen[1]
    redirect "/"
  end

  post '/login' do

    user = Citizen.find( :email => params['login']['email'] ).first
    
    if user && user.password == params['login']['password']

      unless user.confirmed?
        session[:flash_top] = flash("Det här kontot är inte aktiverat. Se ditt bekräftelsemail eller kontakta Artilect.")
        redirect "/"
      end

      session[:user] = user

      #redirect user.may?(:premium) ? "/bevakningar" : "/nyheter"
      redirect "/"
    else
      session[:user] = nil
      session[:flash_login] = flash("Felaktigt lösenord och/eller användarnamn. Försök igen!")
      redirect '/'
    end
  end

  get '/logout' do
    logout!
    redirect '/'
  end


  ## Routes related to registration of new user accounts
  ######################################################

  post '/signup' do
    email = params['signup']['email']
  
    if !email.empty? && email.match(/\w+\@\w+\.\w+/)
      puts "email given at signup: #{email.inspect}"
      key = HashKey.add email
    
      #A.send_registration_mail email, key.keyhash
      #flash("E-mail has been sent to #{email}. The account is created when you click the link in the mail.", :accept)

      flash("Key: <a href='/confirm/#{key.hash}'>#{key.hash}</a>", :accept)     # instead of email while developing
    
      redirect '/'
    else
      flash("You must enter a valid e-mail address!", :error)
      redirect '/'
    end
  end

  get '/confirm/:key/?' do
    @key = params[:key]
    @email = HashKey.check params[:key]
    #puts "Key: #{@key}"
    #puts "Email: #{@email}"
    if @email
      #puts "hittade en email"
      @username_suggestion = @email.match(/^(.*?)@/)[1]
      @name_suggestion = @username_suggestion.gsub(".", " ")#.titleize
      #@username_suggestion = "" if Citizen.find( :nickname => @username_suggestion ).first
      #@index = true
      haml :'register'
    else
      flash("You have provided an invalid registration key!", :error)
      redirect "/"
    end
  end

  post '/confirm/:key' do
  
    unless HashKey.check(params[:key]) == params['signup']['email']
      flash("You have provided an invalid registration key!", :error)
      redirect "/"
    else
      #foo = Citizen.find( :nickname => params['signup']['nickname'] ).first
      #puts "Looking up user from nickname: #{foo.inspect}"
      #if foo
      #  flash("The nickname you chose is already taken!", :error)
      #  @name_suggestion = params['signup']['name']
      #  @email = params['signup']['email']
      #  @key = params['signup']['key']
      #  haml :'register'
      #else
        params['signup'].delete('key')
        params['signup']['confirmed'] = true
        session[:user] = Citizen.create params['signup']
        flash("Your account is created, and you are logged in. Welcome!", :accept)
        redirect "/"
      #end
    end
     
  end


  ## Resetting passwords
  ######################
  
  get '/reset_password/?' do
    @page_title = "Reset Password"
    haml :reset_pwd_request
  end

  post '/reset_password/?' do
    email_given = params['reset_password']['email']
  
    user = Citizen.find( :email => email_given ).first
  
    unless user
      session[:flash_top] = flash "There is no Artilect account connected to #{email_given}."
      redirect "/reset_password"
    end

    key = HashKey.add(email_given).hash
    session[:flash_top] = flash "This app can not yet send email. Here is the confirmation link: </br>#{'&nbsp;'*10}<a href='/reset_password/#{key}'>#{key}</a>", :accept
    redirect "/reset_password"
  end

  get '/reset_password/:key' do
  
    @key = params[:key]
    user = Citizen.find( :email => HashKey.check(@key) ).first rescue nil
  
    unless user
      session[:flash_top] = flash "The key you have entered is not valid."
      redirect "/reset_password"
    end

    haml :reset_password
  end

  post '/reset_password/:key' do
  
    @key = params[:key]
  
    user = Citizen.find( :email => HashKey.check(@key) ).first rescue nil
  
    unless user
      session[:flash_top] = flash "The key you have entered is not valid."
      redirect "/reset_password"
    end

    user.password = params['reset_password']['password']
    session[:user] = user
  
    session[:flash_top] = flash "Your password has been changed and you have been logged in. Welcome back!", :accept
    redirect "/"

  end
  
end