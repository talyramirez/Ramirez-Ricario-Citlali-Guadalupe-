from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/saludo')
def saludo():
    return {"mensaje": "¡Hola desde el contenedor Docker!"}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
