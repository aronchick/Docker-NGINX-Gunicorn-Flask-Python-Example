from flask import Flask, jsonify, abort

flask_main = Flask(__name__)

# Good page
@flask_main.route('/good')
def good_page():
    return jsonify({"message": "This is a good page"}), 200

# Bad page (known issue)
@flask_main.route('/bad')
def bad_page():
    abort(404, description="This page does not exist")

# Error page (bug)
@flask_main.route('/error-bug')
def error_bug():
    raise ValueError("This is a bug!")

# Error page (memory exhaustion attack)
@flask_main.route('/error-memory')
def error_memory():
    # Intentional memory exhaustion
    _ = [0] * (10**9)  # Allocate a large amount of memory
    return jsonify({"message": "This will never be reached"}), 500

# Global error handler
@flask_main.errorhandler(Exception)
def handle_exception(e):
    response = {
        "message": str(e),
        "type": e.__class__.__name__
    }
    return jsonify(response), 500

if __name__ == '__main__':
    flask_main.run(host='0.0.0.0', port=5000)
