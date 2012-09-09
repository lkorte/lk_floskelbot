  class Match
  include Mongoid::Document
  
  field :season, type: String
  field :matchId, type: String
  field :hostName, type: String
  field :hostId, type: Integer
  field :hostGoals, type: Integer
  field :guestName, type: String
  field :guestId, type: Integer
  field :guestGoals, type: Integer
  field :group, type: Integer
  field :date, type: DateTime
  
  index ({ id: 1 })
  index ({ hostId: 1 })
  index ({ guestId: 1 })
end