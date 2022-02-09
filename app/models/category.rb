class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'ピックアップ' },
    { id: 2, name: 'ライフスタイル' },
    { id: 3, name: 'ヘルスケア' },
    { id: 4, name: 'グルメ' },
    { id: 5, name: 'ビューティー' },
    { id: 6, name: 'おでかけ' },
    { id: 7, name: 'インテリア' },
    { id: 8, name: 'レシピ' },
    { id: 9, name: 'お掃除' },
    { id: 10, name: 'ヘアスタイル' },
    { id: 11, name: 'ファッション' },
  ]
end
