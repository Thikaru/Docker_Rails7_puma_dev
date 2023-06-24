# Docker_Rails7_puma_dev

Docker を使った，Rails7 の puma でサーバを立てて開発を行うことができる仮想環境作成用

## 概要

DockerCompose を使用して Rails7 の「Takin」フォルダをコンテナにマウントしてローカルの Takin フォルダ内の Rails アプリの開発を行う．

## 実行手順

'''
%= (1)Dockerfile と同じディレクトリのところに「Takin」という名前の Rails アプリを配置する． =%
%= (2)イメージからコンテナを作成する． =%
docker compose build --no-cache --force-rm
<or>
make build

%= (3)コンテナを起動する =%
docker compose up
<or>
make up

%= (4)Rails アプリが起動しているので，マイグレーションを行う． =%
docker compose exec web rails db:migrate
<or>
make migrate

%= (5)ローカルサイトにアクセスする． =%
URL:<http://0.0.0.0:8888/>

'''

### ＜参考・参照・引用サイト＞

- [docker-compose で立てたコンテナの中にログインする方法](https://qiita.com/koh97222/items/1cec21e3ede5abc31ee9)
- [Dockerfile をビルドしてランする流れ](https://zenn.dev/kazuki_inoue/articles/07de49d81b7608)
- [Docker | docker build と Dockerfile でイメージをビルドする基本](https://qiita.com/YumaInaura/items/e7155b309e109bc75cf8)
- [★ ＜一番参考にした＞ Rails チュートリアルアプリを Docker でコンテナ化してみる](https://katsuya-place.com/docker-rails-app/)
- [Docker で Nginx、Puma(Rails7.0)の環境構築](https://itoka.hatenadiary.com/entry/2022/03/04/004453)
- [Docker + Rails + Puma + Nginx + MySQL](https://qiita.com/eighty8/items/0288ab9c127ddb683315)
- [Docker 上で Ruby on Rails 7 の開発環境を構築してみた](https://mseeeen.msen.jp/rails-docker/)
- []()
