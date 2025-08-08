{
    xdg.configFile."fish/config.fish".text = ''
        if status --is-interactive
            microfetch
        end
        function fish_greeting
            echo Welcome to GoydaOS!!
        end
    '';
}