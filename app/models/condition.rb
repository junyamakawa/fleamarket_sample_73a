class Condition < ActiveHash::Base
  self.data = [
    {id: '', name: '選択してください'}, {id: 1, name: '新品'}, {id: 2, name: '新品同様'}, {id: 3, name: '良品'}, {id: 4, name: '汚損あり'}
  ]
end