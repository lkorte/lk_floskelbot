class Match
  include Mongoid::Document
  
  field :first_name, type: String
  field :season, type: String
  field :id, type: String
  field :hostName, type: String
  field :hostId, type: Integer
  field :hostGoals, type: Integer
  field :guestName, type: String
  field :guestId, type: Integer
  field :guestGoals, type: Integer
  field :group, type: Integer
  field :date, type: DateTime
  
  index :id
  index :hostId
  index :guestId
end