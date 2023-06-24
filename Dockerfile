FROM ruby:3.2.2
ENV APP_ROOT /Takin

# 作業ディレクトリをアプリのルートディレクトリにしています。
WORKDIR $APP_ROOT

# 各種必要なパッケージをインストールしていきます。
# RUN apt-get update 
RUN apt-get install curl
RUN apt update -y && apt upgrade -y
RUN apt-get install nodejs npm -y

# bundle install するためにローカルのGemfileをコンテナ内にコピーします。
COPY ./Takin/Gemfile $APP_ROOT
COPY ./Takin/Gemfile.lock $APP_ROOT

# bundle install を行っていきます。
RUN echo 'gem: --no-document' >> ~/.gemrc && \ 
	cp ~/.gemrc /etc/gemrc && \
	chmod uog+r /etc/gemrc && \
	bundle config --global build.nokogiri --use-system-libraries && \ 
	bundle config --global jobs 4 && \
	bundle install && \
	rm -rf ~/.gem

# アプリの資源を全てコンテナにコピーします。
COPY ./Takin $APP_ROOT/

# コンテナのポート8888を開放します。
EXPOSE 8888

# pumaをポート8888で起動します。
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "8888"]