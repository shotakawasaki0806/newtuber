class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Vlog' },
    { id: 3, name: 'バラエティ' },
    { id: 4, name: '商品紹介・レビュー' },
    { id: 5, name: 'ハウツー' },
    { id: 6, name: '教育' },
    { id: 7, name: 'ゲーム' },
    { id: 8, name: '音楽' },
    { id: 9, name: 'メイク・ファッション' },
    { id: 10, name: '料理' },
    { id: 11, name: 'アニメ・漫画' },
    { id: 12, name: 'VTuber' },
    { id: 13, name: '大食い' },
    { id: 14, name: 'アウトドア' },
    { id: 15, name: 'ペット' },
    { id: 16, name: '衝撃動画' },
    { id: 17, name: '旅行' },
    { id: 18, name: 'スポーツ' },
    { id: 19, name: 'トレンド' },
    { id: 20, name: '政治・ニュース' },
    { id: 21, name: 'パチンコ' },
    { id: 22, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles

  end