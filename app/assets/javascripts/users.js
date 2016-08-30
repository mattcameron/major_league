$(document).on('turbolinks:load', function() {
  if ($('#user-details').length) {
    // limit the number of skills to 4
    check_to_hide_or_show_add_skill_link();

    $('#user-details').on('cocoon:after-insert', check_to_hide_or_show_add_skill_link);

    $('#user-details').on('cocoon:after-remove', check_to_hide_or_show_add_skill_link);
  }
});

function check_to_hide_or_show_add_skill_link() {
  if ($('#user-details .nested-fields').length == 4) {
    $('#add-skill a').hide();
  } else {
    $('#add-skill a').show();
  }
}