jQuery(function ($) {
    $(".importExcel :file").change(function () {
        let selectedFilename = [];
        for (const f of this.files) {
            selectedFilename.push(f.name);
        }
        $(this).siblings(":text").val(selectedFilename.join(","));
    });
});