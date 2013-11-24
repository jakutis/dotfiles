var url = require('system').args[1];
var page = require('webpage').create();
page.open(url, function (status) {
    var check = function() {
        var hasElement = function() {
            return page.evaluate(function() {
                return !!document.getElementById('page_0_documentViewer');
            });
        };
        var getSrc = function() {
            return page.evaluate(function() {
                return document.getElementById('page_0_documentViewer').src;
            });
        };
        var getCookie = function() {
            return page.evaluate(function() {
                return document.cookie;
            });
        };
        var getPages = function() {
            return page.evaluate(function() {
                return $('.flexpaper_lblTotalPages').text().substr(' / '.length);
            });
        };
        if(hasElement()) {
            var src = getSrc();
            var i = src.indexOf('data=');
            if(i >= 0) {
                console.log(src.substr(0, i - 1));
                src = src.substr(i);
                console.log(src.substring('data='.length, src.indexOf('&')));
                console.log(getCookie());
                console.log(getPages());
                phantom.exit();
                return;
            }
        }
        setTimeout(check, 1000);
    };
    check();
});
