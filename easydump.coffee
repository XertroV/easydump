Items = new Mongo.Collection "items"

if Meteor.isClient
  Template.body.helpers {
    items: -> Items.find {}, {sort: {createdAt: -1}}
  }

  Template.body.events {
    "submit .new-item": (event) ->
      event.preventDefault()
      text = event.target.text.value
      Items.insert {
        text: text,
        createdAt: new Date()
      }
      event.target.text.value = ""
  }

if Meteor.isServer
  Meteor.startup ->
