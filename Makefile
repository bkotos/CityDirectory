help:
	@echo "make start-db"
	@echo "                Start MySQL database"
	@echo ""
	@echo "make stop-db"
	@echo "                Stop MySQL database"
	@echo ""
	@echo "make compile"
	@echo "                Compile java project"
	@echo ""
	@echo "make run"
	@echo "                Run java project"
	@echo ""

start-db: stop-db
	@docker-compose up -d

stop-db:
	@docker-compose down

compile:
	@mvn compile

run:
	#java -classpath ./target/classes io.kotos.App
	@mvn exec:java -Dexec.mainClass="io.kotos.App"
