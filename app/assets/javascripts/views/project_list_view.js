var ProjectListView = Backbone.View.extend({
  events: {
    'click #new-project': 'showNewProjectForm',
    'blur #new-project-name': 'hideNewProjectForm',
    'keyup #new-project-name': 'createProject'
  },
  showNewProjectForm: function() {
    $('.js-text-area').hide();
    $('.js-form-area').show();
    $('#new-project-name').focus();
  },
  hideNewProjectForm: function() {
    $('.js-text-area').show();
    $('.js-form-area').hide();
  },
  createProject: function(e) {
    if (e.keyCode == 13) {
    }
  }
});

$(document).ready(function() {
  new ProjectListView({ el: $('#project-list') });
});
