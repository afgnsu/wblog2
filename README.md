WBlog2 (WBlog + CKeditor4 + Paperclip)
========================================

備註：這是未完成品，因為想上傳多個檔案和圖片，就把原作者李亞飛的原作WBlog小改加入CKEditor + Paperclip，另外我不熟slim，就把他還原回 erb 格式 ^_^

The missing open source blog system on Ruby on Rails.

WBlog is open source blog which built for mobile first, it's licenced on MIT, use it for free!

0. Check dependencies

  ```shell
  ruby -v
  # 2.5.3
  rails -v
  # 5.2.6
  mysql --version
  # 8.0.25
  ```

1. Clone it

  `git clone git@github.com:afgnsu/wblog2.git`

  `cd wblog2`

2. Install dependencies & configure

  ```shell
  rvm install 2.5.3
  rvm gemset create rails526
  rvm use 2.5.3@rails526 --default
  rm -rf Gemfile.lock
  bundle
  modify config/database.yml with mysql root password.
  rake db:create db:migrate
  ```

  Update `application.yml` & `database.yml` 's content as you need

3. Start it

  ```shell
  rails s -b 0.0.0.0
  ```

  Open browser with `http://ip:3000`

4. Post the first blog

  visit: http://localhost:3000/admin, input your username and password configurated in `application.yml`.
  then, post a new article.

OK, That's all.

### Deployment

WBlog uses `mina` as automation deployment tool, uses `puma` as the Rack container.

WBlog recommends `nginx` as reverse proxy server.

It will be very fast.

Ruby on Rails project deployment is another topic, I would NOT talk it here.

You can read WBlog wiki for more information: [WBlog 的发布流程(Chinese only now)](https://github.com/windy/wblog/wiki)

## License
MIT. 感謝 深圳 李亞飛先生 開源

