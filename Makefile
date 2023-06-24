up:
	docker compose up -d
build:
	docker compose build --no-cache --force-rm
down:
	docker compose down
down-all:
	docker compose down --rmi all --volumes --remove-orphans
migrate:
	docker compose exec app php artisan migrate
migrate-fresh:
	docker compose exec app php artisan config:cache
	docker compose exec app php artisan migrate:fresh --seed
migrate-dacapo:
	docker compose exec app php artisan dacapo --seed
npm-dev:
	docker compose exec app npm run dev
npm-watch:
	docker compose exec app npm run watch
migrate:
	docker compose exec web rails db:migrate
new-add-column:
	docker compose exec web rails generate migration AddCommentToTasks comment:string
new-db-table:
	docker compose exec web rails generate scaffold User account_name:string password:string admin_flag:boolean
bash:
	docker compose exec web /bin/bash
# build:
# 	docker build ./ -t railstest --no-cache
# run:
# 	docker run -p 8888:8888 --name  rails 65fd70d4068a   
# images:
# 	docker images
# bash:
# 	docker container exec -it rails bash