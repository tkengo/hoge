var ProjectListView = Backbone.View.extend({
  events: {
    'click #new-project': 'showNewProjectForm'
  },
  showNewProjectForm: function() {
  }
});

$(document).ready(function() {
  new ProjectListView({ el: $('#project-list') });
});
