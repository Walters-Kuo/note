let date = new Date();
let options = { timeZone: "Asia/Taipei", hour: 'numeric', minute: 'numeric', second: 'numeric' };

let formatter = new Intl.DateTimeFormat([], options);
console.log(formatter.format(date)); // Prints the current time in Taipei timezone


let date = new Date();

let yearFormatter = new Intl.DateTimeFormat('en', { year: 'numeric', timeZone: 'Asia/Taipei' });
let monthFormatter = new Intl.DateTimeFormat('en', { month: '2-digit', timeZone: 'Asia/Taipei' });
let dayFormatter = new Intl.DateTimeFormat('en', { day: '2-digit', timeZone: 'Asia/Taipei' });

let year = yearFormatter.format(date);
let month = monthFormatter.format(date);
let day = dayFormatter.format(date);

let formattedDate = '' + year + month + day;


let date = new Date();

let year = date.getFullYear();
let month = date.getMonth() + 1; // getMonth() returns a zero-based value (0-11)
let day = date.getDate();

// Pad month and day with leading zeros if necessary
month = month < 10 ? '0' + month : month;
day = day < 10 ? '0' + day : day;

let formattedDate = '' + year + month + day;