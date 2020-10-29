FactoryBot.define do
  factory :work do
    kind { 1 }
    gametitle { 'テストタイトル' }
    gamemodel { 'PS4' }
    work { 'テスト内容' }
    deadline { '2030-10-28' }
    reward { 10000 }
    payment { 'クレカ' }
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :first_work, class: Work do
    kind { 1 }
    gametitle { 'テストタイトル1' }
    gamemodel { 'PS4' }
    work { 'テスト内容' }
    deadline { '2030-10-28' }
    reward { 10000 }
    payment { 'クレカ' }
  end

  factory :second_work, class: Work do
    kind { 1 }
    gametitle { 'テストタイトル2' }
    gamemodel { 'PS4' }
    work { 'テスト内容' }
    deadline { '2030-10-28' }
    reward { 10000 }
    payment { 'クレカ' }
  end
  factory :third_work, class: Work do
    kind { 1 }
    gametitle { 'テストタイトル3' }
    gamemodel { 'PS4' }
    work { 'テスト内容' }
    deadline { '2030-10-28' }
    reward { 10000 }
    payment { 'クレカ' }
  end
end
