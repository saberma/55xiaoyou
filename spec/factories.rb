admin = lambda do
  if u = User.find_by_login('admin')
    return u
  end
  Factory(:admin)
end

Factory.define :user do |u|
  u.login 'ben'
  u.password '55xiaoyou'
end

Factory.define :admin, :parent => :user do |u|
  u.login 'admin'
end

Factory.define :game do |g|
  g.name "小游戏" 
  g.description "小游戏说明"
  g.url "http://www.9654.com/flash/115.swf"
  g.creator &admin
  g.modifier &admin
end

Factory.define :cat_and_dog, :parent => :game do |g|
  g.name "猫狗大战" 
  g.description %Q(
    非常经典的对战小游戏,控制猫(狗)将东西砸向对方，直到对方生命线消耗完，获胜
    # 游戏加载完依次点击"Start","LET'S PLAY"开始
    # 可以选择单人或双人对战,难度分三个级别
    # 猫(狗)上方出现红色箭头表示轮到你进行操作
    # 按住鼠标左鍵不放，上方会出现力度条，放开鼠标，猫(狗)就会把东西砸向对方
    # 砸中了，对方最上方的生命线会减少，减少为0时，你就获胜了
  )
  g.url "http://www.9654.com/flash/115.swf"
end

Factory.define :gold, :parent => :game do |g|
  g.name "黄金矿工" 
  g.description %Q(
    游戏规则:将锚抛出，不断地拉回黄金，黄金总数超过关卡指定的数额即可通关(键盘操作)
    #. 游戏开始后，画面中间的锚会左右摆动
    ##. 当摆动的角度指向你要拿的黄金，
    ##. 按向下键,锚就会抛出去了
    ##. 通关后会有机会购买一些物品
    ##. 按向上键,即要使用物品
  )
  g.url "http://docite.com/blog/wp-content/uploads/2008/08/3872098523.swf"
end
