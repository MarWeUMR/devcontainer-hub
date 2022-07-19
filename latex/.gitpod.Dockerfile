FROM gitpod/workspace-full:latest

RUN sudo install-packages chktex
WORKDIR /home/gitpod
RUN wget https://github.com/cmhughes/latexindent.pl/releases/download/V3.18/latexindent.zip && unzip latexindent.zip
RUN sudo ln -s /home/gitpod/latexindent/latexindent.pl /usr/local/bin/latexindent.pl
RUN yes | sudo cpan -i App::cpanminus && sudo cpanm YAML::Tiny && sudo cpanm File::HomeDir

RUN wget -qO- https://github.com/tectonic-typesetting/tectonic/releases/download/tectonic%400.9.0/tectonic-0.9.0-x86_64-unknown-linux-gnu.tar.gz | tar xvz -C ~

RUN chmod +x ~/tectonic && sudo mv ~/tectonic /usr/local/bin
