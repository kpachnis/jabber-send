## jabber-send

jabber-send is a cli tool for sending messages using XMPP.

## Usage
In the configuration file set your id and password. See the example file in the conf directory.

To send a message simply run 

    jabber-send -c myconf.yaml -m "My Message" -r user@domain -s "My Subject"
    