# Commands:
#   hubot evaluate <github-username> [for <position>]

evaluate = (msg, name, position) ->
  msg
    .http("https://api.github.com/users/#{name}")
    .header("User-Agent: EvaluateBot for Hubot (+https://github.com/pgilad/hubot-evaluate")
    .get() (err, res, body) ->
      msg.send "evaluation of #{name}: #{body}"

module.exports = (robot) ->
  pattern = /evaluate\s+([\w_\-]+)(?:\s*for\s*(\w+))?/i
  robot.respond pattern, (msg) ->
    name = msg.match[1]
    position = msg.match[2]
    evaluate(msg, name, position)
