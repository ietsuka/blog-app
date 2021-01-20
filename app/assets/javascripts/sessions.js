window.addEventListener('DOMContentLoaded', (function () {
  $('#login_form').validate({
    rules: {
      "session[email]": {
        required: true,
      },
      "session[password]": {
        required: true,
      }
    },
    messages: {
      "session[email]": {
        required: 'Eメールアドレスを入力して下さい',
      },
      "session[password]": {
        required: 'パスワードを入力して下さい',
      }
    },
    errorClass: "invalid",
    validClass: "valid",
  });
}))

