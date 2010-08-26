## jabber-send

jabber-send is a cli tool for sending messages using XMPP.

## Usage
To send messages using jabber-send you must already have an account.

In the configuration file set your id and password. See the example file in the conf directory.

To send a message simply run 

    jabber-send -c myconf.yaml -m "My Message" -r user@domain -s "My Subject"
    
## Notes

If you want to send multiline messages you need to use an external formatter such as printf.

    jabber-send -c conf/config.yaml -m "`printf "Line 1 \nLine 2"`" -r user@domain -s "Subject"
