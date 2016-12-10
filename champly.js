/**
 * champly.js
 */

var showError = function(isError, inputId) {
    if (isError) {
        fadeInContainerNoWait('#inputs-error');
        $(inputId).addClass('invalid');
        $('#button-champly').attr('disabled', true);
    } else {
        fadeOutContainer('#inputs-error');
        $(inputId).removeClass('invalid');
        $('#button-champly').attr('disabled', false);
    }
};
var showError2 = function(isError, inputId1, inputId2) {
    if (isError) {
        fadeInContainerNoWait('#inputs-error-2');
        $(inputId1).addClass('invalid');
        $(inputId2).addClass('invalid');
        $('#button-champly').attr('disabled', true);
    } else {
        fadeOutContainer('#inputs-error-2');
        $(inputId1).removeClass('invalid');
        $(inputId2).removeClass('invalid');
        $('#button-champly').attr('disabled', false);
    }
};

$('#input-number').change(function() {
    var isError = true;
    var n = $('#input-number').val();
    if (n == '') {
        $('#inputs-error-text').text('スクランブル数を入力してください。');
    } else if (!n.match(/^[0-9]+$/) || parseInt(n) < 1 || 20 < parseInt(n)) {
        $('#inputs-error-text').text('スクランブル数には、1以上20以下の数値を入力してください。');
    } else {
        isError = false;
    }
    showError(isError, '#input-number');
});

$('#input-ef').change(function() {
    var isError = true;
    var v = $('#input-ef').val();
    if (v == '') {
        $('#inputs-error-text').text('揃っているエッジ数を入力してください。');
    } else if (!v.match(/^[0-9]+$/) || parseInt(v) < 0 || 12 < parseInt(v)) {
        $('#inputs-error-text').text('揃っているエッジ数には、0以上12以下の数値を入力してください。');
    } else {
        isError = false;
    }
    showError(isError, '#input-ef');
    if (!isError) {
        edgesCheck();
    }
});
$('#input-eo').change(function() {
    var isError = true;
    var v = $('#input-eo').val();
    if (v == '') {
        $('#inputs-error-text').text('EO数を入力してください。');
    } else if (!v.match(/^[0-9]+$/) || parseInt(v) < 0 || 12 < parseInt(v)) {
        $('#inputs-error-text').text('EO数には、0以上12以下の数値を入力してください。');
    } else {
        isError = false;
    }
    showError(isError, '#input-eo');
    if (!isError) {
        edgesCheck();
    }
});
$('#input-cf').change(function() {
    var isError = true;
    var v = $('#input-cf').val();
    if (v == '') {
        $('#inputs-error-text').text('揃っているコーナー数を入力してください。');
    } else if (!v.match(/^[0-9]+$/) || parseInt(v) < 0 || 8 < parseInt(v)) {
        $('#inputs-error-text').text('揃っているコーナー数には、0以上8以下の数値を入力してください。');
    } else {
        isError = false;
    }
    showError(isError, '#input-cf');
    if (!isError) {
        cornersCheck();
    }
});
$('#input-co').change(function() {
    var isError = true;
    var v = $('#input-co').val();
    if (v == '') {
        $('#inputs-error-text').text('CO数を入力してください。');
    } else if (!v.match(/^[0-9]+$/) || parseInt(v) < 0 || 8 < parseInt(v)) {
        $('#inputs-error-text').text('CO数には、0以上8以下の数値を入力してください。');
    } else {
        isError = false;
    }
    showError(isError, '#input-co');
    if (!isError) {
        cornersCheck();
    }
});

var edgesCheck = function() {
    var isError = true;
    var ef = $('#input-ef').val();
    var eo = $('#input-eo').val();
    if (12 < parseInt(ef) + parseInt(eo)) {
        $('#inputs-error-2-text').text('揃っているエッジ数とEO数の和を12以下で入力してください。');
    } else {
        isError = false;
    }
    showError2(isError, '#input-ef', '#input-eo');
};
var cornersCheck = function() {
    var isError = true;
    var cf = $('#input-cf').val();
    var co = $('#input-co').val();
    if (8 < parseInt(cf) + parseInt(co)) {
        $('#inputs-error-2-text').text('揃っているコーナー数とCO数の和を8以下で入力してください。');
    } else {
        isError = false;
    }
    showError2(isError, '#input-cf', '#input-co');
};

var onSelectTypeChange = function() {
    var t = $('#select-type option:selected').val();
    if (t == 0 || t == 3) {
        $('#select-parity-label').removeClass('label-disabled');
        $('#select-parity').removeAttr('disabled');
    } else {
        $('#select-parity-label').addClass('label-disabled');
        $('#select-parity').attr('disabled', 'disabled');
    }
    if (t == 3) {
        $('.alt-options-label').removeClass('label-disabled');
        $('#input-ef').removeAttr('disabled');
        $('#input-eo').removeAttr('disabled');
        $('#input-cf').removeAttr('disabled');
        $('#input-co').removeAttr('disabled');
    } else {
        $('.alt-options-label').addClass('label-disabled');
        $('#input-ef').attr('disabled', 'disabled');
        $('#input-eo').attr('disabled', 'disabled');
        $('#input-cf').attr('disabled', 'disabled');
        $('#input-co').attr('disabled', 'disabled');
    }
};
$('#select-type').change(onSelectTypeChange);

$(document).ready(function() {
    onSelectTypeChange();

    $('#inputs-form').submit(function(event) {
        // Submit キャンセル
        event.preventDefault();

        var $form = $(this);
        $.ajax({
            url: $form.attr('action'),
            type: $form.attr('method'),
            dataType: 'jsonp',
            jsonpCallback: 'callback',
            data: $form.serialize(),
            timeout: 30000,

            beforeSend: function(xhr, settings) {
                $('#button-champly').attr('disabled', true);
                fadeOutContainer('#results');
                fadeOutContainer('#results-error');
                fadeInContainer('#results-loading');
                $('#results-error').hide();
            },
            complete: function(xhr, textStatus) {
                $('#button-champly').attr('disabled', false);
                fadeOutContainer('#results-loading');
            },

            success: function(result, textStatus, xhr) {
                var results = result.results;
                var html = '', text = '';
                for (var i = 0, l = results.length; i < l; i++) {
                    html += '<tr><td class="idx">' + (i + 1) + '</td>';
                    html += '<td class="scramble">' + results[i].sequence + '</td></tr>';
                    text += (i + 1) + '. ';
                    text += results[i].sequence + '\n';
                }
                $('#results-tbody').html(html);
                $('#results-text').text(text);
                fadeInContainer('#results');
            },
            error: function(xhr, textStatus, error) {
                fadeInContainer('#results-error');
            }
        });
    });

    $('#button-copy').click(function() {
        $('#results-text').show();
        var textarea = document.getElementById('results-text');
    });
});

// GroundworkCSS の フェードイン・フェードアウト 機能を用いて
// コンテナを表示・非表示する
var fadeInContainerNoWait = function(id) {
    $(id).removeClass('fadeOut');
    $(id).addClass('fadeIn');
    $(id).show();
};
var fadeInContainer = function(id) {
    setTimeout(function() {
        fadeInContainerNoWait(id);
    }, 500);
};
var fadeOutContainer = function(id) {
    $(id).removeClass('fadeIn');
    $(id).addClass('fadeOut');
    setTimeout(function() {
        $(id).hide();
    }, 500);
};
