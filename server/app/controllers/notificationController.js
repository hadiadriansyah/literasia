
exports.check = async (req, res) => {
    var FCM = require('fcm-node');
    var serverKey = 'AAAABfPdGno:APA91bHvLO6uOC1MJ3F-mfPUlWnAU6dfQBuqehxZnDFzhAyzQyAKceQsDtkHWTX7WfYE66Gci3s9ohSoxlwiY-ihG0XSBtsLE_WdGPiR30Lip7iY2bMOpn2EVxHsfjqknMlya4WdVmXO'; // put your server key here
    var fcm = new FCM(serverKey);
 
    var message = { //this may vary according to the message type (single recipient, multicast, topic, et cetera)
        to: 'dzSCugTDTX6pDAC0XZpY35:APA91bEbKZ3q64PaXu0NNt9CIYkamibhjCiq-xgJujI6Cl3NqHj2gO5Tm26UTH93LZVpu4fgm3DYQ0fTqmmtySvdLT8eb9blgfD7yFDll1kAYc7Pns7Y0D4IS-L5ffEmcd_l5BIRv7xz', 
        
        notification: {
            title: 'Anda telah keluar aplikasi selama 30 menit', 
            body: 'Silahkan masuk kedalam ujian' 
        },
        
        data: {  //you can send only notification or only data(or include both)
            my_key: 'my value',
            my_another_key: 'my another value'
        }
    };
    
    fcm.send(message, function(err, response){
        if (err) {
            console.log("Something has gone wrong!");
        } else {
            console.log("Successfully sent with response: ", response);
        }
    });
}