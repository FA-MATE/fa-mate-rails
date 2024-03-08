# frozen_string_literal: true

class PostFinder
  def initialize(category_id:, sub_category_id:, tag_ids:, condition_ids:)
    @category_id = category_id
    @sub_category_id = sub_category_id
    @tag_ids = tag_ids
    @condition_ids = condition_ids
  end

  def call
    posts = Post.select(:id).joins(:tags, :conditions)
    posts = filter_by_category(posts, @category_id)
    posts = filter_by_sub_category(posts, @sub_category_id)
    filter_by_tags_and_conditions(posts, @tag_ids, @condition_ids)
  end

  private

  def filter_by_category(posts, category_id)
    return posts if category_id.blank?

    posts.where(category_id:)
  end

  def filter_by_sub_category(posts, sub_category_id)
    return posts if sub_category_id.blank?

    posts.where(sub_category_id:)
  end

  def filter_by_tags_and_conditions(posts, tag_ids, condition_ids)
    return posts if tag_ids.blank? && condition_ids.blank?

    posts = posts.group('posts.id')
    posts = filter_by_tags(posts, tag_ids)
    filter_by_conditions(posts, condition_ids)
  end

  def filter_by_tags(posts, tag_ids)
    return posts if tag_ids.blank?

    posts
      .where(tags: { id: tag_ids })
      .having('COUNT(DISTINCT tags.id) = ?', tag_ids.size)
  end

  def filter_by_conditions(posts, condition_ids)
    return posts if condition_ids.blank?

    posts
      .where(conditions: { id: condition_ids })
      .having('COUNT(DISTINCT conditions.id) = ?', condition_ids.size)
  end
end
