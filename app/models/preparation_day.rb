class PreparationDay < ActiveHash::Base
  self.data = [
    {id: '', name: '選択してください'}, {id: 1, name: '1日以内'}, {id: 2, name: '3日以内'}, {id: 3, name: '1週間以内'}, {id: 4, name: '1月以内'}, {id: 5, name: '1月以上'}
  ]
end