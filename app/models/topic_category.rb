class TopicCategory < ActiveHash::Base
  include ActiveHash::Associations
  has_many :topics
  
  self.data = [
    {id: 1, name: 'おもしろ'}, {id: 2, name: 'バラエティ'}, {id: 3, name: '意外性'}
    ]
end