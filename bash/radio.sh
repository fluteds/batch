#!/bin/bash

# Define radio streams
rock=http://eu4.fastcast4u.com:5248/;stream.mp3
chill=http://ice1.somafm.com/groovesalad-256-mp3
jazz=https://icecast.walmradio.com:8443/classic
nato=http://stream.zeno.fm/z07vyxbqz8quv
chera=https://stream.zeno.fm/83h238tqsceuv
kola=https://stream.zeno.fm/uz2idrgoqnduv
salsa=http://stream.zeno.fm/2uva4f786reuv
latin=http://stream.zeno.fm/kmvrliqmdfitv
top=https://breakz-high.rautemusik.fm/?ref=radiobrowser-top100-djcharts
regg=http://hd.lagrosseradio.info/lagrosseradio-reggae-192.mp3
regg2=http://somafm.com/m3u/reggae256.m3u
beat=https://ice4.somafm.com/beatblender-128-mp3
folk=https://ice2.somafm.com/folkfwd-128-mp3
drone=https://ice4.somafm.com/dronezone-128-mp3
metal=https://ice2.somafm.com/metal-128-mp3
soul=http://ice1.somafm.com/7soul-128-mp3
rap=http://ice2.somafm.com/fluid-128-mp3

# Function to stop the stream
stop_stream() {
    echo "Stopping the stream..."
    pkill -f mpv
    pkill -f cvlc
    pkill -f mplayer
    echo "" > ~/mtmr_nowplaying.txt  # Clear now-playing info
}

# Function to update the now playing info for MTMR
update_now_playing() {
    local track_name=$1
    echo "$track_name" > ~/mtmr_nowplaying.txt
}

# Function to toggle play/pause
# TODO fix play not playing after pausing
toggle_play_pause() {
    if pgrep -f "mpv" > /dev/null; then
        echo "Pausing the stream..."
        pkill -SIGUSR1 -f mpv  # Send SIGUSR1 to pause
    else
        echo "Resuming the stream..."
        pkill -SIGUSR2 -f mpv  # Send SIGUSR2 to resume
    fi
}

# Function to play the selected station with dynamic song info
play_station() {
    # Stop any currently playing stream before starting a new one
    pkill -f mpv

    # Play the station and capture the song information
    mpv --quiet "$url" --volume=$volume --term-status-msg="Now Playing: ${track_name}" --no-video | while IFS= read -r line; do
        # Check if the line contains 'icy-title' and extract it
        if [[ "$line" =~ icy-title ]]; then
            song_info=$(echo "$line" | sed -n 's/^.*icy-title: \(.*\)$/\1/p')
            if [[ -n "$song_info" ]]; then
                echo "$song_info" > ~/mtmr_nowplaying.txt  # Write only the song info to the file
                echo "Now playing: $song_info"
            else
                echo "No metadata found" > ~/mtmr_nowplaying.txt  # If no song info is found
                echo "No metadata found"
            fi
        fi
    done &
}

# Main loop to keep showing the station list and allowing the user to change stations
while true; do
    echo ""
    echo -e "\033[33m============================ WELCOME TO ./RADIO ==========================\033[0m"
    echo -e "\033[1;34m============================== Station List ==============================\033[0m"
    echo -e "\033[32m1.\033[0m Rock"
    echo -e "\033[33m2.\033[0m Chill"
    echo -e "\033[35m3.\033[0m Jazz"
    echo -e "\033[36m4.\033[0m Nato"
    echo -e "\033[37m5.\033[0m Chera"
    echo -e "\033[31m6.\033[0m Kola"
    echo -e "\033[32m7.\033[0m Salsa"
    echo -e "\033[33m8.\033[0m Latin"
    echo -e "\033[34m9.\033[0m Top"
    echo -e "\033[35m10.\033[0m Reggae"
    echo -e "\033[36m11.\033[0m Reggae 2"
    echo -e "\033[37m12.\033[0m Beat"
    echo -e "\033[31m13.\033[0m Folk"
    echo -e "\033[32m14.\033[0m Drone"
    echo -e "\033[33m15.\033[0m Metal"
    echo -e "\033[34m16.\033[0m Soul"
    echo -e "\033[31m17.\033[0m Rap"
    echo -e "\033[34mq. \033[0m Stop"
    echo -e "\033[1;34m=========================================================================\033[0m"

    # Show the help commands only once
    echo ""
    echo "(?) Help"
    echo "+ to increase volume (volume change might spam terminal)"
    echo "- to decrease volume"
    echo "p to play/pause"
    echo "s to stop"
    echo "c to change station"
    echo ""

    read -p "Select a station (1-17) or (q)uit: " choice

    # Map user choice to the corresponding URL
    case $choice in
        1) url=$rock; track_name="Rock Station" ;;
        2) url=$chill; track_name="Chill Station" ;;
        3) url=$jazz; track_name="Jazz Station" ;;
        4) url=$nato; track_name="Nato Station" ;;
        5) url=$chera; track_name="Chera Station" ;;
        6) url=$kola; track_name="Kola Station" ;;
        7) url=$salsa; track_name="Salsa Station" ;;
        8) url=$latin; track_name="Latin Station" ;;
        9) url=$top; track_name="Top Station" ;;
        10) url=$regg; track_name="Reggae Station" ;;
        11) url=$regg2; track_name="Reggae 2 Station" ;;
        12) url=$beat; track_name="Beat Station" ;;
        13) url=$folk; track_name="Folk Station" ;;
        14) url=$drone; track_name="Drone Station" ;;
        15) url=$metal; track_name="Metal Station" ;;
        16) url=$soul; track_name="Soul Station" ;;
        17) url=$rap; track_name="Rap Station" ;;
        q) stop_stream; exit 0 ;;
        *) echo "Invalid choice"; exit 1 ;;
    esac

    # Default volume 
    volume=85

    # Update the now playing info for MTMR
    update_now_playing "$track_name"

    # Play the selected station
    echo "Playing station: $track_name with volume $volume"
    play_station

    # Main loop to listen for user input commands (no station list)
    while true; do
        echo ""
        read -n 1 input

        case $input in
            +)
                volume=$((volume + 10))
                echo "Increasing volume to $volume"
                stop_stream  # Stop the current stream
                play_station  # Restart with new volume
                update_now_playing "$track_name - Volume: $volume"
                ;;
            -)
                volume=$((volume - 10))
                echo "Decreasing volume to $volume"
                stop_stream  # Stop the current stream
                play_station  # Restart with new volume
                update_now_playing "$track_name - Volume: $volume"
                ;;
            p)
                toggle_play_pause
                update_now_playing "$track_name - Paused"
                ;;
            s)
                stop_stream
                exit 0
                ;;
            c)
                stop_stream
                break  # Break out of the inner loop to select a new station
                ;;
            ?)
                # Help is already displayed above, no need to repeat it here
                ;;
            *)
                echo "Invalid command"
                ;;
        esac
    done
done
