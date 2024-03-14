# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/posts' do
  let!(:old_post) { create(:post_completed) }
  let(:valid_attributes) do
    {
      category_id: old_post.category_id,
      sub_category_id: old_post.sub_category_id,
      title: old_post.title,
      body: old_post.body,
      old_post_conditions_attributes: [{ condition_id: old_post.conditions.first.id }],
      old_post_tags_attributes: [{ tag_id: old_post.tags.first.id }],
      post_images_attributes: [{ image: old_post.post_images.first.image,
                                 order_no: old_post.post_images.first.order_no }]
    }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get posts_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

#  describe 'GET /show' do
#    before do
#      # TODO: テスト用の環境を用意する
#      allow(UserLikePost).to receive(:exists?).and_return(true)
#    end
#
#    it 'renders a successful response' do
#      get post_url(old_post), as: :json
#      expect(response).to be_successful
#    end
#  end
#
#  describe 'post /create' do
#    context 'with valid parameters' do
#      it 'creates a new post' do
#        expect do
#          post posts_url,
#               params: { post: valid_attributes }, headers: valid_headers, as: :json
#        end.to change(Post, :count).by(1)
#      end
#
#      it 'renders a JSON response with the new post' do
#        post posts_url,
#             params: { post: valid_attributes }, headers: valid_headers, as: :json
#        expect(response).to have_http_status(:created)
#        expect(response.content_type).to match(a_string_including('application/json'))
#      end
#    end
#
#    context 'with invalid parameters' do
#      it 'does not create a new post' do
#        expect do
#          post posts_url,
#               params: { post: invalid_attributes }, as: :json
#        end.not_to change(Post, :count)
#      end
#
#      it 'renders a JSON response with errors for the new post' do
#        post posts_url,
#             params: { post: invalid_attributes }, headers: valid_headers, as: :json
#        expect(response).to have_http_status(:unprocessable_entity)
#        expect(response.content_type).to match(a_string_including('application/json'))
#      end
#    end
#  end
#
#  describe 'PATCH /update' do
#    context 'with valid parameters' do
#      let(:new_attributes) do
#        {
#          title: 'new title'
#        }
#      end
#
#      it 'updates the requested post' do
#        patch post_url(old_post),
#              params: { post: new_attributes }, headers: valid_headers, as: :json
#        old_post.reload
#        expect(old_post.title).to eq 'new title'
#      end
#
#      it 'renders a JSON response with the post' do
#        patch post_url(old_post),
#              params: { post: new_attributes }, headers: valid_headers, as: :json
#        expect(response).to have_http_status(:ok)
#        expect(response.content_type).to match(a_string_including('application/json'))
#      end
#    end
#
#    context 'with invalid parameters' do
#      it 'renders a JSON response with errors for the post' do
#        patch post_url(old_post),
#              params: { post: invalid_attributes }, headers: valid_headers, as: :json
#        expect(response).to have_http_status(:unprocessable_entity)
#        expect(response.content_type).to match(a_string_including('application/json'))
#      end
#    end
#  end
#
#  describe 'DELETE /destroy' do
#    it 'destroys the requested post' do
#      expect do
#        delete post_url(old_post), headers: valid_headers, as: :json
#      end.to change(Post, :count).by(-1)
#    end
#  end
end
