class Citizen
end

class Politician < Citizen
  attr_accessor :user_name_politician, :party_aff
  @@every_politician = []
  def initialize(user_name_politician, party_aff)
    @user_name_politician = user_name_politician
    @party_aff = party_aff
    @@every_politician << self
  end
  def self.save
  @@every_politician.each do |x|
    print "Politician's Name:#{x.user_name_politician}\nParty:#{x.party_aff}\n"
    end
  end
  def self.update
    @@every_politician
  end
end



class Voter < Citizen
  attr_accessor :user_name_voter, :political_aff
  @@every_voter = []
  def initialize(user_name_voter, political_aff)
    @user_name_voter = user_name_voter
    @political_aff = political_aff
    @@every_voter << self
  end
  def self.save
    @@every_voter.each do |x|
    print "Voter's Name:#{x.user_name_voter}\nAffiliation:#{x.political_aff}\n"
    end
  end
  def self.update
    @@every_voter
  end
  def delete
  end
end
