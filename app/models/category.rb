class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'ピックアップ', url: "columns_category/pickup.jpeg" },
    { id: 2, name: 'ライフスタイル', url: "columns_category/lifestyle.jpeg" },
    { id: 3, name: 'ヘルスケア', url: "columns_category/healthcare.jpeg" },
    { id: 4, name: 'グルメ', url: "columns_category/Gourmand.jpeg" },
    { id: 5, name: 'ビューティー', url: "columns_category/beauty.jpeg" },
    { id: 6, name: 'おでかけ', url: "columns_category/travel.jpeg" },
    { id: 7, name: 'インテリア', url: "columns_category/interior.jpeg" },
    { id: 8, name: 'レシピ', url: "columns_category/recipe.jpg" },
    { id: 9, name: 'お掃除', url: "columns_category/clean.jpeg" },
    { id: 10, name: 'ヘアスタイル', url: "columns_category/hairstyle.jpeg" },
    { id: 11, name: 'ファッション', url: "columns_category/fashion.jpeg" },
  ]
end
