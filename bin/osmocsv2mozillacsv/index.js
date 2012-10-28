var csv = require('./csv');

process.stdin.resume();
csv().fromStream(process.stdin,{
    columns: true
}).toStream(process.stdout,{
    columns: ['First Name', 'Last Name', 'Display Name', 'Nickname', 'Primary Email', 'Secondary Email', 'Screen Name', 'Work Phone', 'Home Phone', 'Fax Number', 'Pager Number']
}).transform(function(data){
    data['Primary Email'] = data['E-Mail'];
    data['Pager Number'] = data['Cell phone'];
    data['First Name'] = data['First name'];
    data['Last Name'] = data['Last name'];
    return data;
});
