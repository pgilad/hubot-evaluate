# Hubot: hubot-evaluate

A evaluate wrapper for Hubots.

[![Build Status](https://travis-ci.org/hubot-scripts/hubot-evaluate.png)](https://travis-ci.org/hubot-scripts/hubot-evaluate)

See [`src/evaluate.coffee`](src/evaluate.coffee) for full documentation.

## Installation

Add **hubot-evaluate** to your `package.json` file:

```json
"dependencies": {
  "hubot": ">= 2.5.1",
  "hubot-scripts": ">= 2.4.2",
  "hubot-evaluate": ">= 0.0.0"
}
```

Add **hubot-evaluate** to your `external-scripts.json`:

```json
["hubot-evaluate"]
```

Run `npm install hubot-evaluate`

## Sample Interaction

```
user1> hubot evaluate pgilad
Hubot> evaluated pgilad: <data>
```
