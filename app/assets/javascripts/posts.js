window.addEventListener('DOMContentLoaded', (function () {
  $('#comment_form').validate({
    rules: {
      "comment[name]": {
        required: true,
      },
      "comment[comment]": {
        required: true,
      }
    },
    messages: {
      "comment[name]": {
        required: '名前を入力して下さい',
      },
      "comment[comment]": {
        required: 'コメントを入力して下さい',
      }
    },
    errorClass: "invalid",
    validClass: "valid",
  });

  $('#content_form').validate({
    rules: {
      "content[title]": {
        required: true,
      },
      "content[script]": {
        required: true,
      }
    },
    messages: {
      "content[title]": {
        required: 'タイトルを入力して下さい',
      },
      "content[script]": {
        required: '記事を入力して下さい',
      }
    },
    errorClass: "invalid",
    validClass: "valid",
  });

  $('#open').on('click', function () {
    $('#overlay, #modalWindow').fadeIn();
  });

  $('#close').on('click', function () {
    $('#overlay, #modalWindow').fadeOut();
  });


}))

