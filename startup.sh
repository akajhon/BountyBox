#!/usr/bin/env zsh
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
RED='\033[0;31m'
NC='\033[0m'

# Print a welcome message

echo -e '  ██████╗  ██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗██████╗  ██████╗ ██╗  ██╗'
echo -e '  ██╔══██╗██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝'
echo -e '  ██████╔╝██║   ██║██║   ██║██╔██╗ ██║   ██║    ╚████╔╝ ██████╔╝██║   ██║ ╚███╔╝ '
echo -e '  ██╔══██╗██║   ██║██║   ██║██║╚██╗██║   ██║     ╚██╔╝  ██╔══██╗██║   ██║ ██╔██╗ '
echo -e '  ██████╔╝╚██████╔╝╚██████╔╝██║ ╚████║   ██║      ██║   ██████╔╝╚██████╔╝██╔╝ ██╗'
echo -e '  ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝      ╚═╝   ╚═════╝  ╚═════╝ ╚═╝  ╚═╝'
echo -e '               Built and maintained by https://github.com/akajhon                '
echo -e '                     https://github.com/akajhon/BountyBox                        '
echo -e "${BOLD}"
echo -e '                         The BugHunter best friend                               '
echo -e "${NC}"

# Ensure the final executable receives the Unix signals
exec "$@"