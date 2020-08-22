import QtQuick 2.12

Item{
    id: root                                                // 'root' reserved for outmost one
    
    // property declarations
    property bool thumbnail: false                          
    property alias image: photoImage.source

    // signal declarations
    signal clicked                                          

    // functions
    function doSomething(x)                                 
    {
        return x + photoImage.width
    }

    // object properties
    color: "gray"                                           
    x: 20                                                   // try to group related properties together
    y: 20
    height: 150
    width: {                                                // large bindings
        if (photoImage.width > 200) {
            photoImage.width;
        } else {
            200;
        }
    }
    
    // child objects
    Rectangle {                                             
        id: border
        anchors.centerIn: parent; color: "white"

        Image {
            id: photoImage
            anchors.centerIn: parent
        }
    }
    
    // states
    states: State {                                         
        name: "selected"
        PropertyChanges { target: border; color: "red" }
    }
    
    // transitions
    transitions: Transition {                               
        from: ""
        to: "selected"
        ColorAnimation { target: border; duration: 200 }
    }
}
