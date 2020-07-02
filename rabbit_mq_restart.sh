# Kill existing pid
pkill -KILL -u rabbitmq

# Restart rabbitmq service
service rabbitmq-server start

# Starting GUI application
sudo rabbitmqctl start_app
