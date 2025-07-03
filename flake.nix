{
  description = "Ansible Schulung Entwicklungsumgebung";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    hugo =
      pkgs.mkShell
       {
        buildInputs = [
          pkgs.nodePackages.postcss
          pkgs.autoprefixer
          pkgs.hugo
        ];

        shellHook = ''
            clear
            echo '##### DEVELOP ENV ########'
            echo ' '
            echo 'Now you can run `hugo server -D` to work on the page.'
        '';
       };
    slides =
      pkgs.mkShell 
        {
        # Required packages
        buildInputs = [
          pkgs.python3
          pkgs.python3Packages.pip
          pkgs.python3Packages.virtualenv
        ];

        # Shell hook replicates Dockerfile steps
        shellHook = ''
          export VENV_DIR='.venv'
          if [ ! -d "$VENV_DIR" ]; then
            python -m venv $VENV_DIR
            source $VENV_DIR/bin/activate
            pip install --upgrade pip
            pip install mkslides
            pip install ensurepath
          else
            source $VENV_DIR/bin/activate
          fi
          echo "Virtual env is activatet with mkslides."
          mkslides serve slides/ansible-schulung.md
        '';
        };
    };
}
