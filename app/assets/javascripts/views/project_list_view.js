Soleil.ProjectListView = Backbone.View.extend({
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
    var projectName = $('#new-project-name').val();
    if (e.keyCode == 13 && projectName != '') {
      var project = new Soleil.Project();
      project.save({ name: projectName });

      var newProjectList = $('<li>').addClass('exists-project').text(projectName);
      $('li.exists-project:last').after(newProjectList);
      hideNewProjectForm();
    }
  }
});

$(document).ready(function() {
  new Soleil.ProjectListView({ el: $('#project-list') });
});
