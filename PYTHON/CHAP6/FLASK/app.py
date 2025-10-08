from flask import Flask, jsonify, request

# Initialiser l'application Flask
app = Flask(__name__)

# Route 1 : Récupérer un message de bienvenue
@app.route('/api/welcome', methods=['GET'])
def welcome():
    return jsonify({"message": "Bienvenue sur l'API!"})

# Route 2 : Additionner deux nombres
@app.route('/api/add', methods=['GET'])
def add_numbers():
    # Récupérer les paramètres 'a' et 'b' de la requête
    a = request.args.get('a', type=int)
    b = request.args.get('b', type=int)
    
    if a is None or b is None:
        return jsonify({"error": "Les paramètres 'a' et 'b' sont requis!"}), 400

    result = a + b
    return jsonify({"result": result})

# Route 3 : Afficher un message personnalisé
@app.route('/api/greet', methods=['GET'])
def greet():
    name = request.args.get('name', default='Utilisateur', type=str)
    return jsonify({"message": f"Bonjour, {name}!"})

# Lancer l'API en local
if __name__ == '__main__':
    app.run(debug=True, port=5000)