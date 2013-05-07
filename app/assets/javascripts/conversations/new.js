function conversations_new_ready() {
  $('#users_list').tokenInput($('#users_list').data('path'), {
    theme: "facebook",
    crossDomain: false,
    preventDuplicates: true,
    prePopulate: $('#users_list').data('pre'),
    tokenValue: 'name',
    hintText: $('#users_list').data('hint'),
    searchingText: $('#users_list').data('searching'),
  });
}

$(".conversations.new").ready(conversations_new_ready);
$(".conversations.admins").ready(conversations_new_ready);
$(".conversations.bug").ready(conversations_new_ready);
