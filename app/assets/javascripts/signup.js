$(document).on('turbolinks:load', function () {
  $('#signup_form').validate({
    rules: {
      "user[name]": {
        required: true,
      },
      "user[blog_name]": {
        required: true,
      },
      "user[email]": {
        required: true,
      },
      "user[password]": {
        required: true,
      },
      "user[password_confirmation]": {
        required: true,
      }
    },
    messages: {
      "user[name]": {
        required: 'お名前を入力して下さい',
      },
      "user[blog_name]": {
        required: 'ブログネームを入力して下さい',
      },
      "user[email]": {
        required: 'Eメールアドレスを入力して下さい',
      },
      "user[password]": {
        required: 'パスワードを入力して下さい',
      },
      "user[password_confirmation]": {
        required: '確認用パスワードを入力して下さい',
      }
    },
    errorClass: "invalid",
    validClass: "valid",
  });
})
