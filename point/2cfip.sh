#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '2cfip.sh' encrypted at Wed Feb  7 03:19:53 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SYn�+z r��0}����������w�����������  R@�     HU	%&#@��щ�2z�р�S#442hhh� h�  �M�A�2��2i�&0#&�44bFLh�2!�L�4h2d�2a@41M4d�Fd�&��A�ɀMF@�4�i���&L�S��T    ��  F��1�      �&dCd�FL`FM2hh���Ѡ4dCL&�h�2dɀR �b ��4M2ja3%?Q�OQ�x���52��4������� � =&�i�jj�������M�{��C:� =�z����� <!d��=�3(N�Z�0��c&۠��D��BR����Qt�5KgԪf�W0f4�_k?�m��(�"&�{.�l��C�Zi���,��a���E}l�K!\�U�2Z�eY��?B@��𝕶����PADG�/>�xJ�X�����a���5�A��7�s��@ ����Cd�Pz�X���{�������w|�Hb���2V5�0����8�'-�g����`Z-�(8G� �~�_�2��}Vh �Ȅ� 71�x�]�ϝ����_���}��m��E�I_}��}��|�_�D���<�f��Ba��w�k��p�R!^�����鄑� ���9BF;����0��ɛ�z%ji�*��y��o���K��@b) ��iS���ˠ9��~�<. X6�M�Pv]~�|�6����Pz(r7^o��H�.�o��È�A�F���?��ߟ��,��be���k�|F��},ʨ�?5�k�3ni��-���%#w�����⽮�ʽ7���!�P�Cۈ���~D�끁Y�t���`��e (@P�0�C8'(,ІB-b�D����F����Q�V�I*i%E����C
ڞ��N"@�@�{�/EF��NJe�'��vMׁẂ� KL�f�ς�=���+%��=u���K�I�;$�BQl��Nt�!���M�/�4�RW�9�����s��9��x�u�S�2d��2�_�=ufӻ��a��y�E*^n��������t�^�]`H �uw�
d#"�~A�"@         %)JR�K���m��f�ܭ�%�FѴl�����5�P,�ݍ,��BBQ�ϊl�B�!��[!{�"ۢ"&�6�ޗK�b��=�c� � �  �5eB�Zn��h�f5�Ȉ�	���(!����à��P �[� �2EOd�DD�L<!�X�;�����4�x<)�%�drዘ�gj+�ad$���pצW��RT�/;|����}�R�y^��ec�1-��3L	�+n;�����/&A�L��TYl��ϢB^���7#��!p������l �����豈�}8�X���D @w���:#Xb0��tY#7ԡ�"�;j@�Fy)�{	U=�� EϐfB
=�fBz��sYb<A�AG�ݿ3���R����� �F���H����zR<n���U�����������th�N8I^�d���+���y����]~<���>*A!���P� �N��F`a��`a��`a��`a�=Ӏ��|�����8�0���eV�[�m������:�9����!�����v�G.p	'���m`瘻6suIbR��X������$��x���e����A��pZ|[ ���C1������*
�նT�&�5.�)�!��d���-�)t��w~W-*��X���4.��PބJ�@?<�=��@��Ή,�7jr:��ž��M+"�xMW�.څ�����
Ȭ�9ü�]�89(Xt8e.{���=�\��ADDDA��f�ٙ+� c57w�+ly&h.z��z�쮆�J11
G��G�r�F���(0n
�e,	@D�3*^	����ҙ��q��C��:��N0��@�WԈ��(]A�/L7p�ÑM}�}^�> ��B�-3/� �ޓ��-\�� �.E!.�7�@��T�%H��j�h
����8�M�޵��`obk�7�lP2M�2p/A��Ͳ��5%H�~�6�7����WH�8�� �j	� ��������m	k$M��L]�6(;����M�f�:J6	(y�
;�^[�(˄Y�0���,�g�rm�
���plp��0z�T�X5,��聍�`ӌE/�O�x��Q17��  ]�S(j��2IJ$ȓR$��JA�X�+	��Q+ɼO��	?f" ��b�a�2��?��
���isQ{��aX��A𗝲���y!7rcߑ=�ͳ�zX
�v)X�0��)6��XP2f0�p��<�Y�n\9A� ݑ�`���6���7�݊�4���PyB="��	��:b�À�l�<c� ���d!�|CX�ch�7��5�BꖂGU�g�@L���������C@���f��^�AAJg�igK��Е��O$2PL�C�- ��*K�~�&JT�'�~J|�}�X��r��oL�������~=m��K+/�?��bTB���w ������~L����5W�`h�F���1���5wA���۞Q�&b��h}��5����V��D:c1:{u=cQU��9G`�ǌ��}yH@��P�-̞<1�e���P�x��OW�,��RL��N�bƺ�,�;�A���+?�����g	#�>��l3���&ܸa��H�������¬𛘬�j�^K"DeO�V�o\S%)~X�0�u<Kڟ�������''�V��0g'�}��Y��N
h�O
Ҋ1�p�0���%���.4�g=n�}�����>�cӁ�}���n�H�ܓh��[�$Hj�9��xZ�tf`�K�?+Z���ՒxG{���^�9O�z�bQ�ѽ��q��)ܼCc�Ƭ�2���Ec�)�3%�BdE�lbl�.u@��.�p� ݎV�