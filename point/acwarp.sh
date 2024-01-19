#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename 'acwarp.sh' encrypted at Fri Jan 19 07:09:46 UTC 2024
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
BZh91AY&SY={� �_�d0�����������w������������ӠZ� t�� (   ֶ� Xu@��1454Ѫ~S1156�h���z
i�Lb&j=�d�L���i���h�CA�L�Ƅd�z)�5����@� �h  @      �4�M4�d�dMFFd�F���bi�LF�4h�h�%2FM�b �4� 4 �@ 4    �4�M4�d�dMFFd�F���bi�LF�4h�hR���	�jzL�CJmG�m�~�����ڞ�z�����4  4M�:�P�jҾg618������b��mV�6c��Dj�<�\Y��j@h�Ć���ס��N�I333�����[w)�n$2�t<�`�i��d�2l@`�V�@0����%K1���G04�R�`N��)���zkZg�Q�7r�Mr�NE!)d_���1QQed@�A	�,��aX�t�SJz����ٓ���@��1Y����a�a��A�!�!�� BkϦBm��ö�7�8��U�l3�b��5�T�ḘۚQ R'Wb�L-d_:c�l%H�Q�h�����(��US��$��x�p��d||�NV��$�	$<I<�7%l��LW�痉����s}û�4,��#4x��F��7���Ք*7�(�uWw2�{N�s�_놚�T�w,�oC|數��0#T������WF�4��m��F;��ق�Y���n�s�U��+���#I�q���k�s��Y��Í�*�t#���=>���Ƴ_�P�ܷs��B���`�,�5Td�U�0��n"/T�L�r�NY�Fn��z��Ǉ؄O�y�s"���G����j4���2J
HJvZKl�ʮ{�K��a��	lu �<���Mb[e2���V�j�ϫ1����H�qum�Og'��{�0eI5G\{�������i���y�{Z�L%��Ha�L��k������c��K���	C�˩��1�Rh�c�D��Jt6���_�@�{�7�C�%K��@�'��;��|��]ܴ�v�I(O�Ѹ�!Q8� ��H	0c!�B�hI �&�kٶZ�*-6y��r3���D w�7d��>�&�1QR����n=�L�@�C�N!�D�(�I`�k�l�r�Rň��J�$`����.�zJl-e-+��U���0���w��D�����!|�%��%T�-z�9ʮ��uJxk�G�Û��}+�L<�R�`�s=8.���K��?A"�?(���1ha(��2&?���[��x̎
i�:��c�������7�B~����30v����c��F��l���&���.5r�s���l0#Eٰ
�"Tkm�i��Jb�]�%#�F��y�Q��� �����F�s85ҿܪ"�z��"9�IQ�C짫$-���bE��<�;��4��$������,Θ���4U�tIJB���]sS/S��:�sW\�#w�$f�i�N�s���S��	�MŒ�3	EqƱ^�SZB�N�Q7%Xrp�
n�ڌ�7���O�w�t<�H�s929�C�:�s�j�������������`���MI��DڂR�A�Xŵ������˲�^��ڞ�uVcA��Q�Wc��}!��e)��m�������<*��]�1���p�MP$jV�Mw��w��z]3�P"���V��a���2&& `p�ad퇜�T��[ڼ�;}�' �h��.3Xu�E�_g_���Ame�;��[F����QFS�GD,�O{1"�H�a�UA���c�2�<�
)���A�f}��^ 6�W�G�Qs}hA�L�/�V�.(�\�@ɚ0D�O^�N�� ���T2�N�: ���b��!�τP����	T��Ȭ�CI�`OU�~�<�SkF�m�,a2�� �.x����L����zA#q/�*�3K�me���~S�3�.j�&�K�����M��VH8<U��/�i�N�� "@�n{Ft��(V8����:Iɸ %x���f��E�(7���V6�!�G"U��h��2��ݲ��g���LX�h8�LK��+�Dq�.�`DD	�QW�������!��ÂՉ��}N1mFc�?t�pk ��H��	������
9�����uʬ����f��)�� BlZ��x��.kK�`���Vw5����d��!b�@\�gs���N%��L(����Ͱ�=�sb�X��^��bҞ�〱­���xr�mb���h��N�>X��W"�Q��]إ���wR��-��Y��1����dj���zf���M硐fD8��!��(`o`�pX�;y�� ��"�IH��"�BRL+	6�P��JT,���(h����$JU|�T�9�~d��0�fR$�
9!�(d2S�{&��7R<[cQC`�zPA��
��9s�$1�
������r�;��P���������q��0)jn��|�rr�$�A���I�����+��CY��9D҄�!-y�T�p9Y�9c3�H��h�!�A�"CdK �.����s�w��(n�����1��`+����A&���j�A���W`7p�F�u��������3�~��3r�`�OS*{���ܚ"""2�\�b`�C�qdm�O�4n�{j酱	��	�rי�T�=�)SY(�(�
�tD{��� ���a�<̅Xz�t}�8Ꮦs�:�P��[�<�*�9\�����@-���ibw�XF�1Rt�7M&��$�0Ȇ��0�Զc��O3xB#� ʁ��t?lPǌ����Ts�5�j$ۊhmK���������#V�u�RPA|Ȇ��M5㩳�u(+�P_BxS�d�q�����'j�Bo��|�|!���n�� �
I���ӊs<밅a>R���JP�ADJ����r��)5�����lO�$�=��*�H��&�R�H�N�����{Z��M�~<"WI�w��3���#�vC��SU���i^Y
�w&lWD����*�}����ҕ%�K�p�NamI�,>�]����%��sn��c}��nBZʈ~h��הkg�J��� ���%t�ȽaǗ�ZC�����>�dB��Z$p*
��ƙ���`�ɺ~�ܑc�����G�L4�D�{|�Hʺ��^:w�|$��i��������)1IG&&D��D����W[�.[๙Bf#�'��(�]pk��(sYd*I�xkO	[�݆e�����p����Y�H�%��50�	H�P�X��7����'�������/Fn&����v�@DC��y���yT����MP%^�%v*MU��ߑ]O#�g�szRo�XI6�߸j��bgG��Mː�S+sjc�K� ����D�{��������^�X���<a{ׇQ�\U����[��R%��1����U�2�	��`n��4�Z%���I�+�=iZ[rP���$I��ԛ������DF:e�7���ů�3�n���Ա<������a�b�K%���Bypl�rjѪq�7V
U�k_׭=oh��Nq�V�kHI̽�e`]��9a�(��31sB�}xX"�	#C�Z�3���F�!0�-[0�ZoIO�j}^������#���*ЮC�����\hL�z1D�hp�g��}�F�Z�/��H�
�c��