namespace :automatic_publication do
  task archive_post: [:enviroment] do
    published_post = Post.where(status: 'published')
    published_post.each do |post|
      time = (Time.now - post.updated_at) / 60 / 60 / 24
      post.update(status: 'archived') if time > 3
    end
  end
  task publish_post: [:environment] do
    Post.where(status: 'approved').update(status: 'published')
  end
end
