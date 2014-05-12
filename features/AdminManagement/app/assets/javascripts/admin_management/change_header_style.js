$(document).on("page:load", function () {
    change_header_style_to_active()
});

$(document).ready(function () {
    change_header_style_to_active()
});


function change_header_style_to_active() {
    var id = fetch_header_id_base_path();

    $("#" + id).addClass('active')
}


function fetch_header_id_base_path() {

    var id_transform_from_path = _build_header_id();
    var header_mapping = {
        _index: '_index',
        _about_us: '_about_us',
        _register: '_register',
        _login: '_login'
    };

    var mapping = {};

    $.extend(mapping, header_mapping);

    return mapping[id_transform_from_path];

    function _build_header_id() {
        var path = window.location.pathname;

        if (path == '/') {
            path = '/index'
        }

        return path.replace(/\//g, '_');
    }
}


