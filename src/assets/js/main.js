var instr = [ 'push 0x2' , 'pop eax', 'int 0x80' ];
var text = '';
var count = 0;
var index = 0;

function pwn() {
    setInterval(function() { 
	text += instr[index];
	text += '<br>';
	$('#asm').html(text);
	count++;
	index++;
	if(index > 2)
	    index = 0;
	if(count === 60)
	    clear();
    }, 300);
}

function clear() {
    clearInterval();
    count = 0;
    text = '';
}
