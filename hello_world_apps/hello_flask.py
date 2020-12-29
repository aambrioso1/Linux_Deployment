import flask
import os

app = flask.Flask(__name__)


index_template="""
<!DOCTYPE html>
<html>
	<title>
		Hello World App
	</title>
	<body>
		<h3>Hello World!!!</h3>
	</body>
</html>
"""

@app.route('/')
def index():
	# return "Hello World!"
	return flask.render_template_string(index_template)

# We add ngrok_start so we can temporily deploy the app to the internet

# Set the START_NGROK environmental variable to an non-None value to start a tunnel 
# For PowerShell the you can use this command: $env:START_NGROK='True' 

app.config["START_NGROK"] = os.environ.get('START_NGROK') is not None

def start_ngrok():
    from pyngrok import ngrok

    url = ngrok.connect(5000)
    print(f' * Tunnel URL: {url}')

if __name__=='__main__':
	if app.config['START_NGROK']:
		start_ngrok()
		app.run(debug=True)