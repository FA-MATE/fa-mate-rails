# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.find_or_create_by(nickname: 'テストユーザ')
category = Category.find_or_create_by(name: 'ペット', order_no: 1)
sub_category = SubCategory.find_or_create_by(category: category, name: '犬', order_no: 1)
SubCategory.find_or_create_by(category: category, name: '猫', order_no: 2)
condition_group = ConditionGroup.find_or_create_by(name: '居住')
condition = Condition.find_or_create_by(condition_group: condition_group, name: '条件無し', order_no: 1)
tag_group = TagGroup.find_or_create_by(name: '地域', order_no: 1)
tag = Tag.find_or_create_by(tag_group: tag_group, name: '東京都', order_no: 1)
post = Post.find_or_create_by(category: category,
sub_category: sub_category,
user: user,
title: 'テストタイトル',
body: <<~TEXT)
テストボディー
マルチラインのテキストが
どのような形で
表現されるか
確認したい
TEXT
post_tag = PostTag.find_or_create_by(post: post, tag: tag)
user_condition = UserCondition.find_or_create_by(user: user, condition: condition)
post_condition = PostCondition.find_or_create_by(post: post, condition: condition)