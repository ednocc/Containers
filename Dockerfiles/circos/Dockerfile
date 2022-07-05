FROM ubuntu:rolling

WORKDIR /root

RUN apt-get update -y \
    && apt-get install locales perl curl wget build-essential tar gzip pkg-config libgd-dev -y \
    && localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8 \
    && perl -MCPAN -e 'install Missing::Module' \
    && wget http://circos.ca/distribution/circos-0.69-9.tgz && tar zxvf circos-0.69-9.tgz && rm -f circos-0.69-9.tgz \
    && perl -MCPAN -e 'install Math::Round' \
    && perl -MCPAN -e 'install Math::Bezier' \
    && perl -MCPAN -e 'install Config::General' \
    && perl -MCPAN -e 'install Font::TTF::Font' \
    && perl -MCPAN -e 'install Params::Validate' \
    && perl -MCPAN -e 'install Set::IntSpan' \
    && perl -MCPAN -e 'install Text::Format' \
    && perl -MCPAN -e 'install Regexp::Common' \
    && perl -MCPAN -e 'install Statistics::Basic' \
    && perl -MCPAN -e 'install Math::VecStat' \
    && perl -MCPAN -e 'install Clone' \
    && perl -MCPAN -e 'install Readonly' \
    && perl -MCPAN -e 'install SVG' \
    && perl -MCPAN -e 'install GD' \
    && ln -s /root/circos-0.69-9/bin/circos /usr/bin/circos

ENV LANG fr_FR.utf8

ADD . /root/

CMD ["/usr/bin/circos"]
#CMD ["/bin/bash"]

