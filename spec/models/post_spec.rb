require 'spec_helper'

describe Post do
  describe '#word_count' do
    it "returns number of words" do
      post = Post.new(title: "my first post", body: "just three words")
      expect(post.word_count).to eq 3
    end
  end

  describe '#reading_time' do
    context 'when word count is less than 250' do
      it "returns 1" do
        post = Post.new(title: "my first post", body: "a few words")
        expect(post.reading_time).to eq 1      
      end
    end

    context 'when word count is 250' do
      it "returns 1" do
        body = "hello " * 250
        post = Post.new(title: "my first post", body: body)
        expect(post.reading_time).to eq 1      
      end
    end

    context 'when word count is 500' do
      it "returns 2" do
        body = "hello " * 500
        post = Post.new(title: "my first post", body: body)
        expect(post.reading_time).to eq 2      
      end
    end

  end
end