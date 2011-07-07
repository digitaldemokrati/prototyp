# coding: utf-8
                                                                                                                                
class Citizen < Ohm::Model
  attribute :firstname
  attribute :lastname
  attribute :email                          ; index :email
  attribute :password_hash
  attribute :confirmed
  collection :votes, Vote
  collection :propositions, Proposition
  collection :arguments, Argument
  #collection :supporters, Citizen
  #reference :representative, Citizen
  counter :support_size

  set :supporters, Citizen
  set :representatives, Citizen
  
  def name
    "#{firstname} #{lastname}"
  end
  
  def support(rep)
    representatives << rep
    rep.supporters << self
  end

  def unsupport(rep)
    representatives << rep
    rep.supporters << self
  end
  
  # Voting power
  def power
    representing = supporters.inject(0) do |p, c|
      p += 1.0/c.representatives.to_a.length
    end
    (1 + representing)
  end
  
  # Voting power, rounded
  def powerr
    power.round(2)
  end

  # Calculate current voting power given a number of citizens whose votes have already been counted.
  def current_power voters
    supporters.reject { |c| voters.include? c }.inject(1) do |p, c|
      voters << c
      p += c.current_power(voters) / c.representatives.size.to_f
    end
  end

  # Average share of representatives votes
  def average_trust
    total_supported_by_supporters = supporters.inject(0) {|a,c| a += c.representatives.size.to_f }
    (supporters.size / total_supported_by_supporters).round(2)
  end
  
  def link
    "<a href='/citizen/#{id}'>#{name} (#{powerr})</a>"
  end


  ## Stuff related to auth begins here.
  ##############################################################################
  
  def password
    @password ||= BCrypt::Password.new password_hash
  end

  def password= new_password
    @password = BCrypt::Password.create new_password
    self.password_hash = @password
    save
  end
  
  def may? realm
    permissions.include? realm
  end
  
  # NOTE: This is obviously a dummy....
  #
  def permissions
    [:citizen]
  end    
  
  def confirmed?
    #confirmed == "true"
    true
  end
  
end

class Proposition < Ohm::Model
  attribute :title
  attribute :text
  reference :citizen, Citizen
  collection :votes, Vote
  collection :arguments, Argument
  
  def validate
    assert_present :citizen
    assert_present :title
  end
  
  def result
    votes.inject(0) { |r, v| r += v.citizen.current_power(votes.map(&:citizen)) * v.value.to_f }.round(2)
  end
end

class Argument < Ohm::Model
  attribute :name
  attribute :text
  reference :citizen, Citizen
  reference :proposition, Proposition
  reference :vote, Vote
  reference :argument, Argument
  collection :arguments, Argument
end

class Vote < Ohm::Model
  attribute :value
  reference :citizen, Citizen
  reference :proposition, Proposition
  reference :argument, Argument
  
  def to_s
    case value
    when "-1"
      "<b>↓</b> #{citizen.name} röstade nej till #{proposition.title}"
    when "0"
      "→ #{citizen.name} avstod från att rösta om #{proposition.title}"
    when "1"
      "↑ #{citizen.name} röstade ja till #{proposition.title}"
    else
      "[value not found]"
    end
  end
  
  def link
    "<a href='/proposition/#{proposition.id}'>#{to_s}</a>"
  end
end

# Keys used for email confirmation of new users
#
# NOTE: Key.check currently returns an email address. Perhaps it should have an
#       association to a User object instead...?
#
class HashKey < Ohm::Model
  
  attribute :email    ; index :email
  attribute :hash     ; index :hash

  class << self

    def add email_added
      create(
        :email => email_added,
        :hash => Digest::SHA1.hexdigest(email_added.inspect + rand(10**10).inspect)
      ) 
    end

    def check hash_checked
      k = find( :hash => hash_checked ).first
      puts "found this key: #{k.inspect}"
      return k.email if k
    end

  end

end