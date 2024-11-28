# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tweets', type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:tweet) { create(:tweet, user: user) }
  let(:other_user_tweet) { create(:tweet, user: other_user) }

  describe 'GET /tweets' do
    it 'returns a successful response' do
      get tweets_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /tweets/new' do
    context 'when the user is authenticated' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get new_tweet_path
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'assigns a new tweet' do
        expect(assigns(:tweet)).to be_a_new(Tweet)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end
    end

    context 'when the user is not authenticated' do
      it 'redirects to the sign-in page' do
        get new_tweet_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /tweets/:id' do
    it 'returns a successful response' do
      get tweet_path(tweet)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /tweets' do
    context 'when user is authenticated' do
      before { sign_in user }

      it 'creates a new tweet with valid parameters' do
        expect do
          post tweets_path, params: { tweet: { content: 'New Tweet Content' } }
        end.to change(Tweet, :count).by(1)
        expect(response).to redirect_to(tweets_path)
        follow_redirect!
        expect(response.body).to include('Tweet was successfully created.')
      end

      it 'does not create a tweet with invalid parameters' do
        expect do
          post tweets_path, params: { tweet: { content: '' } }
        end.not_to change(Tweet, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is not authenticated' do
      it 'does not create a tweet and redirects to the sign-in page' do
        expect do
          post tweets_path, params: { tweet: { content: 'New Tweet Content' } }
        end.not_to change(Tweet, :count)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH /tweets/:id' do
    context 'when user is authenticated' do
      before { sign_in user }

      it 'updates the tweet with valid parameters' do
        patch tweet_path(tweet), params: { tweet: { content: 'Updated Content' } }
        expect(response).to redirect_to(tweets_path)
        follow_redirect!
        expect(response.body).to include('Tweet was successfully updated.')
        expect(tweet.reload.content).to eq('Updated Content')
      end

      it 'does not update the tweet with invalid parameters' do
        patch tweet_path(tweet), params: { tweet: { content: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(tweet.reload.content).not_to eq('')
      end

      it "does not allow editing another user's tweet" do
        patch tweet_path(other_user_tweet), params: { tweet: { content: 'Updated Content' } }
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign-in page' do
        patch tweet_path(tweet), params: { tweet: { content: 'Updated Content' } }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE /tweets/:id' do
    context 'when user is authenticated' do
      before { sign_in user }

      it 'deletes the tweet' do
        tweet
        expect do
          delete tweet_path(tweet)
        end.to change(Tweet, :count).by(-1)
        expect(response).to redirect_to(tweets_path)
        follow_redirect!
        expect(response.body).to include('Tweet was successfully destroyed.')
      end

      it "does not allow deleting another user's tweet" do
        other_user_tweet
        expect do
          delete tweet_path(other_user_tweet)
        end.not_to change(Tweet, :count)
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to the sign-in page' do
        delete tweet_path(tweet)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
