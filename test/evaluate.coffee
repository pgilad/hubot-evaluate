expect    = require("chai").expect
path      = require("path")
chai      = require("chai")
sinon     = require("sinon")
chai.use require("sinon-chai")
nock = require('nock')

Robot       = require("hubot/src/robot")
TextMessage = require("hubot/src/message").TextMessage
process.env.HUBOT_LOG_LEVEL = 'debug'

describe 'evaluate', ->
  robot = null
  user = null
  adapter = null

  beforeEach (done)->
    nock('https://api.github.com')
    .get('/users/pgilad')
    .reply 200, pgilad: 'true' # JSON response

    robot = new Robot(null, "mock-adapter", false, "hubot")

    robot.adapter.on "connected", ->
      process.env.HUBOT_AUTH_ADMIN = "1"
      # robot.loadFile(path.resolve(path.join("node_modules/hubot/src/scripts")), "auth.coffee")
      require('../index')(robot)

      # load help scripts to test help messages
      hubotScripts = path.resolve 'node_modules', 'hubot', 'src', 'scripts'

      user = robot.brain.userForId '1', {
        name: 'mocha'
        room: '#mocha'
      }
      adapter = robot.adapter
      setTimeout(done, 250)

    do robot.run

  afterEach ->
    do robot.shutdown
    nock.cleanAll()

  describe 'respond evaluate', ->
    it 'replies evaluate', (done)->
      adapter.on "send", (envelope, strings)->
        try
          expect(strings).to.have.length(1)
          data = JSON.parse strings[0]
          expect(data).to.equal( pgilad: true )
          do done
        catch e
          done e
      adapter.receive new TextMessage(user, "#{robot.name} evaluate pgilad")
