Before do
  Factory(:admin)
end

假如 /我已经以用户(.*),密码(.*)登录/ do |login, password|
  假如 "我在退出页面"
  假如 "我在登录页面"
  当 "我输入昵称为#{login}"
  当 "我输入密码为#{password}"
  而且 "我点击登录"
end

假如 /我已经以管理员(.*)身份登录/ do |login|
  假如 "我已经以用户#{login},密码55xiaoyou登录"
end

假如 /有一个小游戏/ do
  Factory(:game)
end
