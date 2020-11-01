/*
*   Legt Gruppennamen, Standard- und Sonderkanäle fest.
*   Gruppenspezifische Kanäle können über die Einträge channel1-channel8 für Shortrange und channel1-channel9 für Longrange festgelegt werden.
*   Hier werden die in der radiosettings.hpp definierten Kanalnamen oder Klassennamen der Kanäle verwendet.
*
*   Beispiel:
*
    class BLUFOR {
        class group1 {
            groupName = "Command";

            class shortrange {
                defaultChannel = 1;
                altChannel = 3;
                altChannelOnlyTL = 1;

                channel1 = "Command Kanal";
                channel3 = "net13";
                channel7 = "Command Intern";
            };

            class longrange {
                defaultChannel = 2;
                altChannel = 5;
                altChannelOnlyTL = 1;

                channel2 = "Air";
                channel5 = "net10";
            };
        };
    };
*
*/

// class BLUFOR {
//     class Gamma {
//         groupName = "Gamma";

//             class longrange {
//                 defaultChannel = 1;
//                 channel1 = "Command Channel";
//             };        
//     };

//     class Alpha {
//         groupName = "Alpha";

//         class shortrange {
//             defaultChannel = 1;
//             altChannel = 2;
//             channel1 = "Alpha 1";
//             channel2 = "Alpha 2";
//         };
        
//         class longrange {
//             defaultChannel = 1;
//             channel1 = "Command Channel";            
//         };
//     };

//     class Alpha1 {
//         groupName = "Alpha 1";

//         class shortrange {
//             defaultChannel = 1;
//             channel1 = "Alpha 1";
//         };
//     };

//     class Alpha2 {
//         groupName = "Alpha 2";

//         class shortrange {
//             defaultChannel = 1;
//             channel1 = "Alpha 2";
//         };
//     };       

//     class Bravo {
//         groupName = "Bravo";

//         class shortrange {
//             defaultChannel = 1;
//             altChannel = 2;
//             channel1 = "Bravo";
//         };
        
//         class longrange {
//             defaultChannel = 1;
//             channel1 = "Command Channel";            
//         };
//     };

//     class Bravo1 {
//         groupName = "Bravo 1";

//         class shortrange {
//             defaultChannel = 1;
//             channel1 = "Bravo";
//         };
//     };

//     class Bravo2 {
//         groupName = "Bravo 2";

//         class shortrange {
//             defaultChannel = 1;
//             channel1 = "Bravo";
//         };
//     };      
// };

// class OPFOR {

// };

// class INDEPENDENT {

// };
