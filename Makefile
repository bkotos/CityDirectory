help:
	@echo "make compile"
	@echo "                Compile java code"
	@echo ""
	@echo "make run"
	@echo "                Run java project"
	@echo ""

compile:
	@mvn compile

run:
	@java -classpath ./target/classes io.kotos.App
