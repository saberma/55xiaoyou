#动作
假如 /我在(.*)页面/ do |page|
  url = ""
  case page
  when "退出"
    url = logout_path
  when "登录"
    url = login_path
  end
  raise 'visit url is blank' if url.blank?
  visit url
end

而且 /我进入(.*)链接/ do |label|
  click_link(label)
end

当 /我输入(.*)为(.*)/ do |label, value|
  fill_in(label, :with => value)
end

当 /我选择(.*)为(.*)/ do |label, value|
  select(value, :from => label)
end

当 /我上传(.+)/ do |field|
  attach_file(field, "#{RAILS_ROOT}/public/images/rails.png")
end

当 /我选中(.*)/ do |field|
  choose(field)
end

当 /我勾选(.*)/ do |field|
  check(field)
end

当 /我勾去(.*)/ do |field|
  uncheck(field)
end

而且 /我点击(.*)/ do |label|
  click_button(label)
end

而且 /我在第(\d+)条记录中点击(.*)按钮/ do |pos, button_label|
  within("tbody >tr:nth-child(#{pos})") do
    click_link button_label
  end
end

#判断
那么 /我应该能看到:(.*)/ do |text|
  response.should contain(text)
end

那么 /我应该看不到:(.*)/ do |text|
  response.should_not contain(text)
end

那么 /浏览器后台返回:(.*)/ do |text|
  encoded_text = ActiveSupport::JSON.encode(text);
  response.should contain(encoded_text[1,encoded_text.size-2]);
end

那么 /我将看到以下数据/ do |hashes|
  hashes.rows.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      response.should have_selector("tbody > tr:nth-child(#{i+1}) > td:nth-child(#{j+1})") do |td|
        text = td.inner_text
        text.should == cell
      end
    end
  end
end
