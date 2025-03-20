#!/bin/bash

display_main_menu() {
    clear
    echo "========================================"
    echo "          Proxy Panel Menu             "
    echo "========================================"
    echo "Please select an option:"
    echo "1) 3X-UI"
    echo "2) Marzban"
    echo "3) Marzneshin"
    echo "4) Exit Script"
    echo "========================================"
}

# Main loop
while true; do
    display_main_menu
    read -p "Enter your choice (1-4): " choice

    case $choice in
        1)
            echo "OK - You selected 3X-UI"
           
            mkdir -p /root/certs
            echo "Folder /root/certs created (if it didn't already exist)."

           
            while true; do
                clear
                echo "========================================"
                echo "       3X-UI Certificate Options       "
                echo "========================================"
                echo "Please select a file to edit:"
                echo "1) cert.crt (/root/certs/cert.crt)"
                echo "2) private.key (/root/certs/private.key)"
                echo "3) Back to main menu"
                echo "========================================"

                read -p "Enter your choice (1-3): " subchoice

                case $subchoice in
                    1)
                        echo "Opening nano /root/certs/cert.crt..."
                        nano /root/certs/cert.crt
                        ;;
                    2)
                        echo "Opening nano /root/certs/private.key..."
                        nano /root/certs/private.key
                        ;;
                    3)
                        echo "Returning to main menu..."
                        break  
                        ;;
                    *)
                        echo "Invalid choice! Please select a number between 1 and 3."
                        read -p "Press Enter to continue..."
                        ;;
                esac
            done
            ;;
        2)
            echo "OK - You selected Marzban"
            
            mkdir -p /var/lib/marzban/certs
            echo "Folder /var/lib/marzban/certs created (if it didn't already exist)."

           
            while true; do
                clear
                echo "========================================"
                echo "      Marzban Certificate Options      "
                echo "========================================"
                echo "Please select a file to edit:"
                echo "1) cert.crt (/var/lib/marzban/certs/cert.crt)"
                echo "2) private.key (/var/lib/marzban/certs/private.key)"
                echo "3) Back to main menu"
                echo "========================================"

                read -p "Enter your choice (1-3): " subchoice

                case $subchoice in
                    1)
                        echo "Opening nano /var/lib/marzban/certs/cert.crt..."
                        nano /var/lib/marzban/certs/cert.crt
                        ;;
                    2)
                        echo "Opening nano /var/lib/marzban/certs/private.key..."
                        nano /var/lib/marzban/certs/private.key
                        ;;
                    3)
                        echo "Returning to main menu..."
                        break  
                        ;;
                    *)
                        echo "Invalid choice! Please select a number between 1 and 3."
                        read -p "Press Enter to continue..."
                        ;;
                esac
            done
            ;;
        3)
            echo "OK - You selected Marzneshin"
            
            mkdir -p /var/lib/marzneshin/certs
            echo "Folder /var/lib/marzneshin/certs created (if it didn't already exist)."

            
            while true; do
                clear
                echo "========================================"
                echo "     Marzneshin Certificate Options    "
                echo "========================================"
                echo "Please select a file to edit:"
                echo "1) cert.crt (/var/lib/marzneshin/certs/cert.crt)"
                echo "2) private.key (/var/lib/marzneshin/certs/private.key)"
                echo "3) Back to main menu"
                echo "========================================"

                read -p "Enter your choice (1-3): " subchoice

                case $subchoice in
                    1)
                        echo "Opening nano /var/lib/marzneshin/certs/cert.crt..."
                        nano /var/lib/marzneshin/certs/cert.crt
                        ;;
                    2)
                        echo "Opening nano /var/lib/marzneshin/certs/private.key..."
                        nano /var/lib/marzneshin/certs/private.key
                        ;;
                    3)
                        echo "Returning to main menu..."
                        break  
                        ;;
                    *)
                        echo "Invalid choice! Please select a number between 1 and 3."
                        read -p "Press Enter to continue..."
                        ;;
                esac
            done
            ;;
        4)
            echo "Exiting script. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice! Please select a number between 1 and 4."
            read -p "Press Enter to continue..."
            ;;
    esac
done
