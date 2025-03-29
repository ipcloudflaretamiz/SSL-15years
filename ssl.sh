#!/bin/bash

display_main_menu() {
    clear
    echo "========================================"
    echo "          Cloudflare SSL             "
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
                echo "       3X-UI Cloudflare SSL       "
                echo "========================================"
                echo "Please select a file to edit:"
                echo "1) cert.crt"
                echo "2) private.key"
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
                echo "      Marzban Cloudflare SSL      "
                echo "========================================"
                echo "Please select a file to edit:"
                echo "1) cert.crt"
                echo "2) private.key"
                echo "3) Update SSL settings"
                echo "4) Back to main menu"
                echo "========================================"
                read -p "Enter your choice (1-4): " subchoice
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
                        echo "Updating SSL settings in /opt/marzban/.env..."
                        
                        # Ask for port
                        read -p "Enter the port number for Marzban (e.g., 2083): " MARZBAN_PORT
                        
                        if [ ! -f /opt/marzban/.env ]; then
                            echo "File /opt/marzban/.env does not exist. Creating it..."
                            mkdir -p /opt/marzban
                            touch /opt/marzban/.env
                        fi

                        # Comment out previous port if exists
                        if grep -E '^[[:space:]]*UVICORN_PORT[[:space:]]*=' /opt/marzban/.env; then
                            sed -i 's|^[[:space:]]*\(UVICORN_PORT[[:space:]]*=.*\)|#\1|' /opt/marzban/.env
                            echo "Commented out UVICORN_PORT line."
                        fi

                        # Add space before equal sign for UVICORN_PORT
                        sed -i 's|^[[:space:]]*\(UVICORN_PORT[[:space:]]*=[[:space:]]*\)|UVICORN_PORT = |' /opt/marzban/.env

                        # Update the UVICORN_PORT
                        echo "UVICORN_PORT = $MARZBAN_PORT" >> /opt/marzban/.env
                        echo "Set UVICORN_PORT to $MARZBAN_PORT"

                        # Add SSL details
                        if grep -E '^[[:space:]]*UVICORN_SSL_CERTFILE[[:space:]]*=' /opt/marzban/.env; then
                            sed -i 's|^[[:space:]]*\(UVICORN_SSL_CERTFILE[[:space:]]*=.*\)|#\1|' /opt/marzban/.env
                            echo "Commented out UVICORN_SSL_CERTFILE line."
                        fi
                        if grep -E '^[[:space:]]*UVICORN_SSL_KEYFILE[[:space:]]*=' /opt/marzban/.env; then
                            sed -i 's|^[[:space:]]*\(UVICORN_SSL_KEYFILE[[:space:]]*=.*\)|#\1|' /opt/marzban/.env
                            echo "Commented out UVICORN_SSL_KEYFILE line."
                        fi
                        echo 'UVICORN_SSL_CERTFILE="/var/lib/marzban/certs/cert.crt"' >> /opt/marzban/.env
                        echo "Added new UVICORN_SSL_CERTFILE at the end of the file."
                        echo 'UVICORN_SSL_KEYFILE="/var/lib/marzban/certs/private.key"' >> /opt/marzban/.env
                        echo "Added new UVICORN_SSL_KEYFILE at the end of the file."

                        echo "SSL settings updated successfully."
                        echo "Restarting Marzban..."
                        marzban restart
                        echo "Marzban restarted successfully."
                        read -p "Press Enter to continue..."
                        ;;
                    4)
                        echo "Returning to main menu..."
                        break
                        ;;
                    *)
                        echo "Invalid choice! Please select a number between 1 and 4."
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
                echo "     Marzneshin Cloudflare SSL    "
                echo "========================================"
                echo "Please select a file to edit:"
                echo "1) cert.crt"
                echo "2) private.key"
                echo "3) Update SSL settings"
                echo "4) Back to main menu"
                echo "========================================"
                read -p "Enter your choice (1-4): " subchoice
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
                        echo "Updating SSL settings in /etc/opt/marzneshin/.env..."
                        
                        # Ask for port
                        read -p "Enter the port number for Marzneshin (e.g., 2083): " MARZNESHIN_PORT
                        
                        if [ ! -f /etc/opt/marzneshin/.env ]; then
                            echo "File /opt/marzneshin/.env does not exist. Creating it..."
                            mkdir -p /etc/opt/marzneshin
                            touch /etc/opt/marzneshin/.env
                        fi

                        # Comment out previous port if exists
                        if grep -E '^[[:space:]]*UVICORN_PORT[[:space:]]*=' /etc/opt/marzneshin/.env; then
                            sed -i 's|^[[:space:]]*\(UVICORN_PORT[[:space:]]*=.*\)|#\1|' /etc/opt/marzneshin/.env
                            echo "Commented out UVICORN_PORT line."
                        fi

                        # Add space before equal sign for UVICORN_PORT
                        sed -i 's|^[[:space:]]*\(UVICORN_PORT[[:space:]]*=[[:space:]]*\)|UVICORN_PORT = |' /etc/opt/marzneshin/.env

                        # Update the UVICORN_PORT
                        echo "UVICORN_PORT = $MARZNESHIN_PORT" >> /etc/opt/marzneshin/.env
                        echo "Set UVICORN_PORT to $MARZNESHIN_PORT"

                        # Add SSL details
                        if grep -E '^[[:space:]]*UVICORN_SSL_CERTFILE[[:space:]]*=' /etc/opt/marzneshin/.env; then
                            sed -i 's|^[[:space:]]*\(UVICORN_SSL_CERTFILE[[:space:]]*=.*\)|#\1|' /etc/opt/marzneshin/.env
                            echo "Commented out UVICORN_SSL_CERTFILE line."
                        fi
                        if grep -E '^[[:space:]]*UVICORN_SSL_KEYFILE[[:space:]]*=' /etc/opt/marzneshin/.env; then
                            sed -i 's|^[[:space:]]*\(UVICORN_SSL_KEYFILE[[:space:]]*=.*\)|#\1|' /etc/opt/marzneshin/.env
                            echo "Commented out UVICORN_SSL_KEYFILE line."
                        fi
                        echo 'UVICORN_SSL_CERTFILE="/var/lib/marzneshin/certs/cert.crt"' >> /etc/opt/marzneshin/.env
                        echo "Added new UVICORN_SSL_CERTFILE at the end of the file."
                        echo 'UVICORN_SSL_KEYFILE="/var/lib/marzneshin/certs/private.key"' >> /etc/opt/marzneshin/.env
                        echo "Added new UVICORN_SSL_KEYFILE at the end of the file."

                        echo "SSL settings updated successfully."
                        echo "Restarting Marzneshin..."
                        marzneshin restart
                        echo "Marzneshin restarted successfully."
                        read -p "Press Enter to continue..."
                        ;;
                    4)
                        echo "Returning to main menu..."
                        break
                        ;;
                    *)
                        echo "Invalid choice! Please select a number between 1 and 4."
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
