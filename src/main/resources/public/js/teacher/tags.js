$(document).ready(function() {

    var $tags = $('.tags');

    var tags = new window.Bloodhound({
        datumTokenizer: window.Bloodhound.tokenizers.obj.whitespace('name'),
        queryTokenizer: window.Bloodhound.tokenizers.whitespace,
        prefetch: '/tags'
    });

    tags.initialize();

    $tags.tagsinput({
        trimValue: true,
        freeInput: false,
        typeaheadjs: {
            name: 'tags',
            displayKey: 'name',
            valueKey: 'name',
            source: tags.ttAdapter()
        }
    });
});