require './voter_sim_classes.rb'
puts `clear`
def welcome  # Welcomes the user and asks CLUD. Then returns user_action.
  puts "Welcome citizen!"
  puts "What would you like to do today?\n(C)reate\n(L)ist\n(U)pdate\n(D)elete"
  welcome_option = gets.chomp.capitalize
  welcomeoption = false
  until welcomeoption

    case welcome_option
    when "C"
      puts "Okay, lets create a user."
      create
      welcomeoption = true
    when "L"
      puts "Okay, lets create a list."
      list
      welcomeoption = true
    when "U"
      puts "Okay, lets update some information."
      update
      welcomeoption = true
    when "D"
      puts "Okay, lets delete some information."
      delete
      welcomeoption = true
    else
      puts "NOT A VALID OPTION.\nPlease Choose:\nC)Create\nL)List\nU)Update\nD)Delete"
      welcomeoption = false
      welcome_option = gets.chomp.capitalize
    end
  end
end

def create #Creates type of user, chooses between voter or politician and type of affiliation.
  puts "What would you like to create: (A)Voter or a (B)Politician?"
  user_type = gets.chomp.capitalize

  usertype = false

  until usertype

    case user_type
    when "A"
      puts "Awesome. Now lets go to the next step."
      usertype = true
      puts "What's your last name?"
      user_lname = gets.chomp.capitalize
      puts "What's your first name?"
      user_fname = gets.chomp.capitalize
      user_name_voter = "#{user_lname},#{user_fname}"
      # Voter.new(user_name_voter)
      puts "What's your political affiliation?\nA)Liberal\nB)Conservative\nC)Tea Party\nD)Socialist\nE)Neutral"
      political_aff = gets.chomp.capitalize
      politicalaff = false
      until politicalaff
        case political_aff
        when "A"
          politicalaff = true
          political_aff = "Liberal"
          Voter.new(user_name_voter, political_aff)
        when "B"
          politicalaff = true
          political_aff = "Conservative"
          Voter.new(user_name_voter, political_aff)
        when "C"
          politicalaff = true
          political_aff = "Tea Party"
          Voter.new(user_name_voter, political_aff)
        when "D"
          politicalaff = true
          political_aff = "Socialist"
          Voter.new(user_name_voter, political_aff)
        when "E"
          politicalaff = true
          political_aff = "Neutral"
          Voter.new(user_name_voter, political_aff)
        else
          puts "Invalid Input. Please Choose:\nA)Liberal\nB)Conservative\nC)Tea Party\nD)Socialist\nE)Neutral"
          political_aff = gets.chomp.capitalize
        end
      end
    when "B"
      puts "Awesome. Now lets go to the next step."
      usertype = true
      puts "What's your last name?"
      user_lname = gets.chomp.capitalize
      puts "What's your first name?"
      user_fname = gets.chomp.capitalize
      user_name_politician = "#{user_lname},#{user_fname}"
      puts "What is party affiliation?:\nA)Republican\nB)Democrat"
      party_aff = gets.chomp.capitalize
      partyaff = false
      until partyaff
        case party_aff
        when "A"
          partyaff = true
          party_aff = "Republican"
          Politician.new(user_name_politician, party_aff)
        when "B"
          partyaff = true
          party_aff = "Democrat"
          Politician.new(user_name_politician, party_aff)
        else
          puts "Invalid Input. Please Choose:\nA)Republican\nB)Democrat"
          party_aff = gets.chomp.capitalize
        end
      end
    else
      puts "INCORRECT INPUT!Please choose (A) for Voter or (B)for Politician."
      user_type = gets.chomp.capitalize
    end
  end
  welcome
end

def list #Lists all voters or politicians.
  puts "Which list would you like to see?:\nA)Voters\nB)Politicians"
  choose_list = gets.chomp.capitalize
  chooselist = false
  until chooselist
    case choose_list
    when "A"
      puts`clear`
      Voter.save
      puts "Press enter when you finish reviewing the list to go to the Welcome Menu."
      press_enter = gets.chomp
      break
    when "B"
      puts `clear`
      Politician.save
      puts "Press enter when you finish reviewing the list to go to the Welcome Menu."
      press_enter = gets.chomp
      break
    else
      puts "Please choose a valid option.\nA)Voters\nB)Politicians"
      choose_list = gets.chomp.capitalize
    end
  end
  welcome
end

def update
  puts "Do you wish to update your A)Name or B)Affiliation?"
  update_choice = gets.chomp.capitalize
  updatechoice = false
  until updatechoice
    case update_choice
    when "A"
      update_name
    when "B"
      update_affiliation
    else
      puts "Please choose : A)Name or B)Affiliation"
    end
  end
end

def update_name #Updates users name and last name.
  puts "Which type of user would you like to update?\nA)Voter\nB)Politician"
  user_update = gets.chomp.capitalize
  userupdate = false
  until userupdate
    case user_update
    when "A"
      userupdate = true
      puts "Please type your Last Name"
      user_verification_l = gets.chomp.capitalize
      puts "Please type your First Name"
      user_verification_f = gets.chomp.capitalize
      user_verification_pass = "#{user_verification_l},#{user_verification_f}"
      Voter.update.each do |x|
        if user_verification_pass == x.user_name_voter
          puts "Okay, you are in the database. Type your correct last name."
          user_name_change_l = gets.chomp.capitalize
          puts "Now type your correct name."
          user_name_change_f = gets.chomp.capitalize
          x.user_name_voter = "#{user_name_change_l},#{user_name_change_f}"
        else
          puts "We could not find you in our database. Please try again."
        end
      end
    when "B"
      userupdate = true
      puts "Please type your Last Name"
      user_verification_l = gets.chomp.capitalize
      puts "Please type your First Name"
      user_verification_f = gets.chomp.capitalize
      user_verification_pass = "#{user_verification_l},#{user_verification_f}"
      Politician.update.each do |x|
        if user_verification_pass == x.user_name_politician
          puts "Okay, you are in the database. Type your correct last name."
          user_name_change_l = gets.chomp.capitalize
          puts "Now type your correct name."
          user_name_change_f = gets.chomp.capitalize
          x.user_name_politician = "#{user_name_change_l},#{user_name_change_f}"
        else
          puts "We could not find you in our database. Please try again."
        end
      end
    else
      puts "Please choose a correct option.\nA)Voter\nB)Politician"
      break
    end
  end
  welcome
end

def update_affiliation #updates affiliation.
  puts "Are you a A)Voter or a B)Politician?"
  user_type = gets.chomp.capitalize
  usertype = false
  until usertype
    case user_type
    when "A"
      usertype = true
      puts "I need to find you in our database.\nPlease type your Last Name"
      user_verification_l = gets.chomp.capitalize
      puts "Please type your First Name"
      user_verification_f = gets.chomp.capitalize
      user_verification_pass = "#{user_verification_l},#{user_verification_f}"
      Voter.update.each do |x|
        if user_verification_pass == x.user_name_voter
          puts "Okay, you are in the database."
          puts "To which political affiliation do you want to belong?\nA)Liberal\nB)Conservative\nC)Tea Party\nD)Socialist\nE)Neutral"
          update_political_affiliation = gets.chomp.capitalize
          updatepoliticalaffiliation = false
          until updatepoliticalaffiliation
            case update_political_affiliation
            when "A"
              x.political_aff = "Liberal"
              updatepoliticalaffiliation = true
            when "B"
              x.political_aff = "Conservative"
              updatepoliticalaffiliation = true
            when "C"
              x.political_aff = "Tea Party"
              updatepoliticalaffiliation = true
            when "D"
              x.political_aff = "Socialist"
              updatepoliticalaffiliation = true
            when "E"
              x.political_aff = "Neutral"
              updatepoliticalaffiliation = true
            else
              puts "Choose one of the following:\nA)Liberal\nB)Conservative\nC)Tea Party\nD)Socialist\nE)Neutral"
              update_political_affiliation = gets.chomp.capitalize
            end
          end
        end
      end

    when "B"
      usertype = true
      puts "I need to find you in our database.\nPlease type your Last Name"
      user_verification_l = gets.chomp.capitalize
      puts "Please type your First Name"
      user_verification_f = gets.chomp.capitalize
      user_verification_pass = "#{user_verification_l},#{user_verification_f}"
      Politician.update.each do |x|
        if user_verification_pass == x.user_name_politician
          puts "Okay, you are in the database."
          puts "To which party affiliation do you want to belong?\nA)Republican\nB)Democrat"
          update_party_affiliation = gets.chomp.capitalize
          updatepartyaffiliation = false
          until updatepartyaffiliation
            case update_party_affiliation
            when "A"
              x.party_aff = "Republican"
              updatepartyaffiliation = true
            when "B"
              x.party_aff = "Democrat"
              updatepartyaffiliation = true
            else
              puts "Choose one of the following:\nA)Republican\nB)Democrat"
              update_party_affiliation = gets.chomp.capitalize
            end
          end
        else
          puts "Sorry, we could not find you in our database."
          puts "Try again"
          user_verification_f = gets.chomp.capitalize
        end
      end
    end
  end
  welcome
end

def delete
  puts "Which type of user would you like to delete?\nA)Voter\nB)Politician"
  user_delete = gets.chomp.capitalize
  userdelete = false
  until userdelete
    case user_delete
    when "A"
      userdelete = true
      puts "Please type your Last Name"
      user_verification_l = gets.chomp.capitalize
      puts "Please type your First Name"
      user_verification_f = gets.chomp.capitalize
      user_verification_pass = "#{user_verification_l},#{user_verification_f}"
      Voter.update.each do |x|
        if user_verification_pass == x.user_name_voter
          Voter.update.delete(x)
          puts "You have successfully deleted the user #{user_verification_pass}. Press enter to go to the Welcome Menu."
          press_enter = gets.chomp
        else
          puts "We could not find you in our database. Please try again."
        end
        welcome
      end
    when "B"
      userdelete = true
      userdelete = true
      puts "Please type your Last Name"
      user_verification_l = gets.chomp.capitalize
      puts "Please type your First Name"
      user_verification_f = gets.chomp.capitalize
      user_verification_pass = "#{user_verification_l},#{user_verification_f}"
      Politician.update.each do |x|
        if user_verification_pass == x.user_name_politician
          Politician.update.delete(x)
          puts "You have successfully deleted the user #{user_verification_pass}. Press enter to go to the Welcome Menu."
          press_enter = gets.chomp
        else
          puts "We could not find you in our database. Please try again."
        end
        welcome
      end
    else
      puts "Choose A)Voter or B)Politician."
    end
  end
  welcome
end
p welcome
