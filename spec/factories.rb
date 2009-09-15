Factory.define :game do |g|
  g.name "猫狗大战" 
  g.description %Q(
    非常经典的对战小游戏
    # 游戏加载完依次点击"Start","LET'S PLAY"开始
    # 可以选择单人或双人对战,难度分三个级别
    # 猫(狗)上方出现红色箭头表示轮到你进行操作
    # 按住鼠标左鍵不放，上方会出现力度条，放开鼠标，猫(狗)就会把东西砸向对方
    # 砸中了，对方最上方的生命条会减少，减少为0时，你就获胜了
  )
  g.url "http://www.9654.com/flash/115.swf"
end
