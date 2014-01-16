Soleil.ProjectListView = Backbone.View.extend({
  events: {
    'click #new-project': 'showNewProjectForm',
    'blur #new-project-name': 'hideNewProjectForm',
    'keyup #new-project-name': 'createProject'
  },
  initialize: function() {
    _.bindAll(this, 'render');

    this.collection.bind('add', this.render);
    this.collection.fetch({ success: this.render });
  },
  render: function() {
    $('li.exists-project', this.$el).remove();
    this.collection.each(function(project) {
      var li = $('<li>').addClass('exists-project');
      var link = $('<a>').attr('href', '#').text(project.get('name'));

      $('#new-project').before(li.append(link));
    }, this);
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

      this.collection.add(project);
    }
  }
});

$(document).ready(function() {
  var projectList = new Soleil.ProjectList();
  new Soleil.ProjectListView({ el: $('#project-list'), collection: projectList });
});
