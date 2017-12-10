/**
 * Created by yoshi on 2017/12/10.
 */
$(function () {
    // DOM のレンダリングよりjsの読み込みの方が早いので100ms遅くする
    Project.init();

    $('#project_established_at').datepicker({
        dateFormat: 'yy-mm-dd'
    });

    autosize($('#project_description'))
});

$(document).on('keyup', 'input, textarea', function() {
    Project.init();
});

$('#project_main_image').on('change', function (e) {
    Project.renderImg(e);
});


var Project = {

    init: function () {
        this.renderTitle();
        this.put_value();
    },

    renderTitle: function () {
        var val = $('#project_title').val();
        $('#_project_title').text(val);
    },

    renderImg: function (e) {
        e = e.originalEvent;
        var target = e.dataTransfer || e.target;
        var file = target && target.files && target.files[0];

        var $preview = $('#_img_preview');

        var reader = new FileReader();
        reader.onload = function (e) {
            $preview.empty();
            $preview.attr('src', e.currentTarget.result)
        };
        reader.readAsDataURL(file);
    },

    put_value: function () {
        var $textarea = $('#project_description');
        var converter = new showdown.Converter();

        var val = $textarea.val();
        var html = converter.makeHtml(val);
        $('#markdown-preview').html(html);
    }
};