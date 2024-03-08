class AppData
  attr_reader :app_data
  # TODO: キャッシュキーは一貫して管理するか検討余地あり
  APP_DATA_CACHE_KEY = 'app_data'
  APP_DATA_CACHE_EXPIRES_IN = 5.minutes
  
  def initialize
    @app_data = Rails.cache.fetch(APP_DATA_CACHE_KEY, expires_in: APP_DATA_CACHE_EXPIRES_IN) do
      {
        condition_groups: ConditionGroup.all.to_a,
        conditions: Condition.all.to_a,
        categories: Category.all.to_a,
        sub_categories: SubCategory.all.to_a,
        tag_groups: TagGroup.all.to_a,
        tags: Tag.all.to_a,
      }
    end
  end
end
