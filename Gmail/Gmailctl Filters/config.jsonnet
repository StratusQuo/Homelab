local lib = import 'gmailctl.libsonnet';

local perc = {                    
  or: [
    { has: '10%' },{ has: '15%' },
    { has: '20%' },{ has: '25%' }, 
    { has: '30%' },{ has: '35%' }, // Common percentages seen in ad messages get   
    { has: '40%' },{ has: '45%' }, // defined here in the "pct" variable, which
    { has: '50%' },{ has: '55%' }, // will be useful for our filters later.
    { has: '60%' },{ has: '66%' }, // 
    { has: '70%' },{ has: '75%' },
    { has: '80%' },{ has: '85%' },
    { has: '90%' },{ has: '95%' },
  ],
};

local orderPhrase = {
  or: [
    { has: 'Order Receipt' }, { has: 'your order' }, { has: 'order confirmaton' }, { has: 'your payment' },   // Phrases pertaining to order numbers and   
    { has: 'your etsy purchase' }, { has: 'my account payment processed' }, { has: 'your purchase' },        // receipts are placed here. and passed to
    { has: 'your gift purchase' }, { has: 'thinkgeek order' }, { has: 'Your threadless order' },             // the "orderPhrase" variable.
    { has: 'order from Woot' }, { has: 'your amazon order' }, { has: 'Return Confirmation' }, 
    { has: 'your amazon order' }, { has: 'Your package' }, { has: 'Order Has Been Updated' },                         
    { has: 'UPS My Choice' }, { has: 'UPS Ship Notification' }, { has: 'BestBuy order' }, 
    { has: 'Your payment' }, { has: 'Your contribution' }, { has: 'order has shipped' }, 
    { has: 'Your download' }, { has: 'Your Amazon.com order' }, { has: 'Payment scheduled' }, 
    { has: 'bill is ready' }, { has: 'order confirmation' }, { has: 'thanks for becoming a backer' }, 
    { has: 'you have authorized a payment' }, { has: 'changed your pledge' }, { has: 'successfully funded' }, 
    { has: 'you sent a payment' }, { has: 'amazon.com order' }, { has: 'payment received' }, 
    { has: 'Purchase Confirmation' }, { has: 'pledge receipt' }, { has: 'Your TopatoCo Order' }, 
    { has: 'Humble Bundle order' }, { has: 'your transaction' }, { has: 'Package From TopatoCo' }, 
    { has: 'Your best offer has been submitted' }, { has: 'Offer Retraction Notice' }, 
    { has: "You've received a gift copy" }, { has: 'Your Etsy Order' }, { has: 'Thanks for contributing to' }, 
    { has: 'Shipping Confirmation' }, { has: 'Purchase Receipt' },
  ],
};


//---------------------- Version & Config --------------------------//

{
  version: "v1alpha3",
  author: {
    name: "YOUR NAME HERE (auto imported)",
    email: "your-email@gmail.com"
  },

//---------------------------- Labels --------------------------//
//
// Note: labels management is optional. If you prefer to use the
// GMail interface to add and remove labels, you can safely remove
// this section of the config.
//

  labels: [
    {
      name: "Orders",
      color: {
        background: "#a2dcc1",
        text: "#04502e"
      }
    },
  ],




//---------------------------------------------- Rules --------------------------------------//
  
   rules:[
    {
      filter: {
        from: "mail@mail.adobe.com OR info@fsastore.com OR marketing@ses.vevor.com OR converse@e.converse.com OR Coursera@email.coursera.org OR info@i.drop.com OR announce@parallels-universe.com OR newsletter@email.hm.com OR staples@connected.staples.com OR info@twitter.com OR events@seatgeek.com OR newsletter@mail.coinbase.com",
        isEscaped: true
      },
      actions: {
        delete: true
      }
    },
    {
      filter: orderPhrase,
      actions: {
        star: true,
        markImportant: true,
        labels:[
          "Orders"
        ]
      }
    },
    {
      filter: perc,
      actions: {
        delete: true,
      }
    }
  ]
}
