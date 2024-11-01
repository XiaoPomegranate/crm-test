jQuery.fn.extend({
    initForm(url) {
        $.ajax({
            url,
            success: data => {
                this.find(":input[name]").val(function () {
                    return data[this.name];
                });
            }
        });
        return this;
    }
});