chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'aws', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../scripts/aws')(@robot)

  it 'registers a cluster status respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/cluster status/i)
