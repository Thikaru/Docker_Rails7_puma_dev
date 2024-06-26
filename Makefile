up:
	docker compose up
build:
	docker compose build --no-cache --force-rm
down:
	docker compose down
down-all:
	docker compose down --rmi all --volumes --remove-orphans
migrate:
	docker compose exec web rails db:migrate
new-add-column:
	docker compose exec web rails generate migration AddCommentToTasks comment:string
new-db-table:
	docker compose exec web rails generate scaffold User account_name:string password:string admin_flag:boolean
bash:
	docker compose exec web /bin/bash
bundle:
	docker compose exec web bundle install
# build:
# 	docker build ./ -t railstest --no-cache
# run:
# 	docker run -p 8888:8888 --name  rails 65fd70d4068a   
# images:
# 	docker images
# bash:
# 	docker container exec -it rails bash