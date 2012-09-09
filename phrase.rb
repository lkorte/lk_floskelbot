class Phrase
  include Mongoid::Document
  
  field :author, type: String
  field :text, type: String
  
  index({ id: 1 })
  index({ author: 1 })
  index({ text: 1 })
end