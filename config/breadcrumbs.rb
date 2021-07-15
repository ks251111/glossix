crumb :root do
  link "Home", root_path
end

crumb :new_user do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :login do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :show_user do |user|
  link "#{user.nickname}さんの詳細", user_path(user)
  parent :root
end

crumb :following do |user|
  link "#{user.nickname}さんのフォロー一覧", followings_user_path(user)
  parent :show_user, user
end

crumb :follower do |user|
  link "#{user.nickname}さんのフォロワー一覧", followers_user_path(user)
  parent :show_user, user
end

crumb :edit_user do |user|
  link "登録情報の編集",  edit_user_registration_path(user)
  parent :root
end

crumb :new_article do
  link "記事の投稿", new_article_path
  parent :root
end

crumb :show_article do |article|
  link "#{article.title}", article_path(article)
  parent :root
end

crumb :edit_article do |article|
  link "記事の編集", edit_article_path(article)
  parent :show_article, article
end

crumb :search_article do
  link "検索結果", search_articles_path
  parent :root
end

crumb :talks do
  link "Q&A", talks_path
  parent :root
end

crumb :new_talk do
  link "質問・相談の投稿", new_talk_path
  parent :talks
end

crumb :show_talk do |talk|
  link "#{talk.title}", talk_path(talk)
  parent :talks
end

crumb :edit_talk do |talk|
  link "質問・相談の編集", edit_talk_path(talk)
  parent :show_talk, talk
end

crumb :category do |article|
  link "カテゴリー", category_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).