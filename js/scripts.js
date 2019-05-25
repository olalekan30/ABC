
(function (global, undefined) {
    var TelerikDemo = global.TelerikDemo = {};

    TelerikDemo.ChangeImageColor = function (sender, eventArgs) {
        setTimeout(function () {
            var selectedColor = sender.get_selectedColor();

            var ImagePreview = $get("ImagePreview");
            ImagePreview.src = "images/" + selectedColor.substr(1) + ".jpg";

            $get("selectedColor").style.backgroundColor = selectedColor;
            $get("colorName").innerHTML = sender.get_selectedColorTitle();
        }, 10);
    };

})(window);