user = User.find_or_create_by!(email: "demo@example.com") do |u|
  u.password = "password"
end

Article.find_or_create_by!(title: "How to build webapps that scale", user: user) do |a|
  a.description = "Web development technologies have evolved an incredible clip over the past few years."
  a.body = "# Introducing RealWorld.\n**It's a great solution for learning how other frameworks work.**"
  a.tag_list = "realworld implementations"
end
