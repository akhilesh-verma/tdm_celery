# Start attendance worker
celery -n 'classes_task' -A celery_tasks.classes_task --loglevel=info -Q classes

# Start upload worker
celery -n 'attendance_worker' -A celery_tasks.attendance_task worker --loglevel=info -Q attendance

# Stop docker
# docker stop <name>
# docker rm <name>
