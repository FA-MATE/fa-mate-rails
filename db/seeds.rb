# frozen_string_literal: true

## データクレーンジング
PostTag.delete_all
PostImage.destroy_all
PostCondition.delete_all
Post.delete_all
Tag.delete_all
TagGroup.delete_all
SubCategory.delete_all
Category.delete_all
UserCondition.delete_all
User.delete_all
Condition.delete_all
ConditionGroup.delete_all

increased_id = 1
condition_groups = {
  '年齢': %w[条件無し 20歳以上 大人を含むの家族構成],
  '居住形態': %w[条件無し マンション可 一戸建て以上 庭付き一戸建て以上],
  '今後のケア': %w[条件無し 連絡可能 毎月の近況共有可能]
}.map.with_index(1) do |kv, id|
  name, conditions = kv
  ConditionGroup.create(id:, name:, order_no: id).tap do |condition_group|
    conditions.each.with_index(1) do |condition_name, order_no|
      Condition.create(id: increased_id, condition_group_id: condition_group.id, name: condition_name, order_no:)
      increased_id += 1
    end
  end
end

users = %w[user hoge fuga].map.with_index do |nickname, id|
  user = User.new(id:, nickname:)
  condition_groups.each do |condition_group|
    user.conditions << condition_group.conditions[rand(condition_group.conditions.length)]
  end
  user.save!
  user
end

increased_id = 1
categories = {
  '犬': %w[品種不明な犬 トイプードル チワワ ロングコートチワワ 柴犬 タイニープードル ミニチュアダックスフンド フレンチブルドッグ ポメラニアン 豆柴 ティーカッププードル],
  '猫': %w[品種不明な猫 ミックス スコティッシュフォールド マンチカン ミヌエット ラグドール ノルウェージャンフォレストキャット サイベリアン メインクーン ブリティッシュショートヘア ベンガル アメリカンショートヘア],
  '鳥': %w[品種不明な鳥 タイハクオウム ワカケホンセイインコ ヨウム キバタン ズクロオトメインコ クロクモインコ モモイロインコ セキセイインコ オカメインコ ボタンインコ コガネメキシコインコ ナナクサインコ
           バライロビタイウロコインコ ベニコンゴウインコ ルリコンゴウインコ ナナイロメキシコインコ ワキコガネウロコインコ ホオミドリアカウロコインコ サザナミインコ キソデインコ オオホンセイインコ ショウジョウインコ シロハラインコ 九官鳥]
}.map.with_index(1) do |kv, id|
  name, sub_categories = kv
  Category.create(id:, name:, order_no: id).tap do |category|
    sub_categories.each.with_index(1) do |sub_category_name, order_no|
      SubCategory.create(id: increased_id, category_id: category.id, name: sub_category_name, order_no:)
      increased_id += 1
    end
  end
end

increased_id = 1
tag_groups = {
  '地域': %w[関東 中部 中国 四国 中部 九州 沖縄 近畿 北海道 東北],
  '年齢': %w[1ヶ月以内 3ヶ月以内 6ヶ月以内 9ヶ月以内 1年以内 3年以内 6年以内 9年以内 10年以上],
  '性別': %w[不明 オス メス],
  'ワクチン接種': %w[未接種 接種済]
}.map.with_index(1) do |kv, id|
  name, tags = kv
  TagGroup.create(id:, name:, order_no: id).tap do |tag_group|
    tags.each.with_index(1) do |tag_name, order_no|
      Tag.create(id: increased_id, tag_group_id: tag_group.id, name: tag_name, order_no:)
      increased_id += 1
    end
  end
end

tag_groups ||= TagGroup.all.to_a
condition_groups ||= ConditionGroup.all.to_a
categories ||= Category.all.to_a
users ||= User.all.to_a
30.times do |i|
  category = categories[rand(categories.size)]
  post = Post.new(
    id: i + 1,
    category:,
    sub_category: category.sub_categories[rand(category.sub_categories.size)],
    user_id: users[rand(users.size)].id,
    title: "#{i + 1}: 愛護センターより保護　豆柴風MIX",
    body: <<~BODY
小柄でお散歩大好き、甘えん坊のシニア犬です
引っ張らず、無駄吠えせず、上手に歩きます
畑仕事やお散歩のパートナーにピッタリです
引っ張らないので、ご高齢の方でも大丈夫です

まだ苦手な事が少しありますが　こちらが気をつけてあげれば大丈夫な程度です。信頼関係が深まれば苦手な事も大丈夫になる可能性があります

良く寝て、良く食べます
BODY
  )
  tag_groups.each do |tag_group|
    post.tags << tag_group.tags[rand(tag_group.tags.size)]
  end
  condition_groups.each do |condition_group|
    post.conditions << condition_group.conditions[rand(condition_group.conditions.size)]
  end

  3.times do
    file_name = "pet#{rand(11)}.jpg"
    post_image = PostImage.new
    post_image.image.attach(io: File.open("public/images/dummy/#{file_name}"), filename: file_name)
    post.post_images << post_image
  end
  post.save!
end
