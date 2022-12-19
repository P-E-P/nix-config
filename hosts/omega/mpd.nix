{ ... }:
{
  enable = true;
  extraConfig = ''
        input {
        plugin "curl"
        }
        audio_output {
        type "pulse" # MPD must use Pulseaudio
        name "Pulseaudio" # Whatever you want
        server "127.0.0.1"
        }
        audio_output {
        type "fifo"
        name "mpd_fifo"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
        }
  '';
}
