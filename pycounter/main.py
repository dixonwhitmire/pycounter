import os
from flask import Flask
import redis


redis_host = os.getenv('REDIS_HOST', 'localhost')
redis_port = int(os.getenv('REDIS_PORT', '6379'))
redis_client = redis.Redis(host=redis_host, port=redis_port)

app = Flask(__name__)


@app.route('/counter', methods=['GET'])
def get_request_count():
    current_count = redis_client.incr('counter', amount=1)
    return f'Current count is {current_count}'


@app.route('/reset', methods=['GET'])
def reset_request_count():
    redis_client.set('counter', '0')
    return f'Current count is 0'


def configure_redis_client():
    return redis_client


redis_client = configure_redis_client()

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
