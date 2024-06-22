from flask import Flask, request, jsonify
import torch
from transformers import GPTNeoForCausalLM, GPT2Tokenizer

app = Flask(__name__)

# Load model and tokenizer
model_name = "EleutherAI/gpt-neo-1.3B"
model = GPTNeoForCausalLM.from_pretrained(model_name)
tokenizer = GPT2Tokenizer.from_pretrained(model_name)

@app.route('/generate', methods=['POST'])
def generate():
    data = request.json
    prompt = data['prompt']

    inputs = tokenizer(prompt, return_tensors="pt")
    outputs = model.generate(inputs["input_ids"], max_length=150)

    text = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return jsonify({"response": text})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
