AWS = require 'aws-sdk'
AWS.config.region = 'us-east-1';
ECS = new AWS.ECS {apiVersion: '2014-11-13'}
regions = ['us-east-1', 'us-west-2']

# Description:
#
#
# Notes:
#

module.exports = (robot) ->
  robot.respond /cluster help/i, (res) ->
    res.send "1. cluster status\n2. {cluster-name} container status"

  robot.respond /cluster status/i, (res) ->
    ECS.listClusters {}, (err, listClustersData) ->
      if err
        res.send err
      params = {clusters: listClustersData.clusterArns}
      ECS.describeClusters (err, describeClustersData) ->
        if err
          res.send err
        else
          res.send "/code " + JSON.stringify describeClustersData, null, '\t'

  robot.respond /(.*) container status/i, (res) ->
    cluster = res.match[1]
    ECS.listContainerInstances {cluster: cluster}, (err, data) ->
      if err
        res.send err
      params = {containerInstances: data.containerInstanceArns}
      ECS.describeContainerInstances params, (err, describeContainerInstancesData) ->
        if err
          res.send err
        else
          res.send "/code " + JSON.stringify describeContainerInstancesData, null, '\t'
