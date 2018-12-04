$(document).ready(function () {
    $('.show_table').click(function () {
        let current_id = $(this).attr('id');
        if (!$('#table_' + current_id).is(':empty')) {
            $('#table_' + current_id).html('');
            return;
        }
        $.ajax({
            url: '/dictionaries/' + current_id,
            success: function (data) {
                let result_data;
                if (data.empty) {
                    result_data = "<p style='color:red'>Словарь не содержит ни одной пары слов</p>";
                } else {
                    result_data = data.table;
                }
                $('#table_' + current_id).html(result_data);
            },
        });
    });
});