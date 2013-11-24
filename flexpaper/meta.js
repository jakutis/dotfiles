var sys = require('system');
var url = require('system').args[1];
var page = require('webpage').create();
sys.stderr.write('Opening main web page\n');
page.open(url, function (status) {
    var check = function() {
        sys.stderr.write('Checking for document\n');
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
        var getCSSSrc = function() {
            return page.evaluate(function() {
                var src = document.getElementById('page_0_documentViewer').style.backgroundImage;
                if(src.substr(0, 'url('.length) === 'url(') {
                    src = src.substr('url('.length);
                    return src.substr(0, src.length - 1);
                }
                return '';
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
            sys.stderr.write('Checking for document ID\n');
            var i = src.indexOf('data=');
            if(i < 0) {
                src = getCSSSrc();
                i = src.indexOf('data=');
            }
            if(i >= 0) {
                sys.stderr.write('Outputing metadata\n');
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
