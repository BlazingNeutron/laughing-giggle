
upload-run: upload run

connect:
	sshpass -p$$TRILOBOT_PWD ssh $$TRILOBOT_USER@$$TRILOBOT_HOST

stop:
	sshpass -p$$TRILOBOT_PWD ssh $$TRILOBOT_USER@$$TRILOBOT_HOST 'bash -c ~/src/scripts/stop.sh'

run:
	sshpass -p$$TRILOBOT_PWD ssh $$TRILOBOT_USER@$$TRILOBOT_HOST 'bash -c "~/src/scripts/run.sh $(SCRIPT)"'

upload:
	sshpass -p$$TRILOBOT_PWD scp -r ~/src/ $$TRILOBOT_USER@$$TRILOBOT_HOST:~/src/

clean:
	sshpass -p$$TRILOBOT_PWD ssh $$TRILOBOT_USER@$$TRILOBOT_HOST 'rm -rf ~/src/ && mkdir -p ~/src/'

init:
	ssh-keygen -R $$TRILOBOT_HOST
	sshpass -p$$TRILOBOT_PWD ssh -o StrictHostKeyChecking=accept-new $$TRILOBOT_USER@$$TRILOBOT_HOST pwd
	sshpass -p$$TRILOBOT_PWD ssh $$TRILOBOT_USER@$$TRILOBOT_HOST 'mkdir -p ~/src/'
	sshpass -p$$TRILOBOT_PWD scp -r ./scripts/ $$TRILOBOT_USER@$$TRILOBOT_HOST:~/src/