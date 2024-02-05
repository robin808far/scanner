#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '2cfip.sh' encrypted at Mon Feb  5 09:39:32 UTC 2024
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
BZh91AY&SY"�y q_�0}����������w����������N�$��     � IH)�'䚞�FF��i�O(l��Q�'���P4 244      b Ʉ ��4ѓ�L�1#&4h�	�F�4�2`��=Tb �hh@i� �4b0���  h�@124dd)�� d@  h4�  4M  F!�     R�P�#��M��#M�FF�a�&LL�dɠh�42h4�16D3I�i���Ă%� #F�0i�M�Szjh�=�O�SSѦ�i���  ��i���kh�<��	�ٴg����kk����n�şBi��xB�����T���-��Cnc��µiB�ʔ�����7\n\+ֶ�jX[�&�k���ᆙC4�r��_��|/�;F�7-��L���ܰ�v�)�[L���nf�75�iе��] ?��xO1p�S=��Bͧ��<%Ը|H�����Pn���Y�D�P!�����7�}6Փh5!��]�[��<�����%ɱ����2i�/�Y�=�u��E{��;a�X��4�(�@O�n�Cҁ�g���5C�!Q����O=Z�p��DI�   YE�$0@  d�rV�NtJ'�����C�5�z|�]9:C�"�+�3�^�Ȕ9�o=6֑�;�1�֚N`��8D�)�����q� S�� �)@��o�;T����h���U~��j��a
�
�3� a���f�U��*f�8M�ڡ8��@�ʘ���^��Ծ�3B���S����v8�Z�ёk��́��TQ�R��(�c�F�yϿ��˶�'Qy��UA��C�6I"�}�"�1q���Ax���� ��aP0M!�	��e!�E]��[����mQ�,c���PQLHI,��!b/��i��t:ʉ�Ozy�J}=����(:�4գ��
;�BE�b��A����G�o���@;�8=җ���=���G�%}~�R!I�,�����A+�n�����
�BKr`�����ֵ�kZ�w��mx^�FǤ�[�Bw��ӳ���Q�b)j��o���s�wL6q��B��d/
!��A� �0�A��r�         )JR��%<�[1�r;��n�\�Pp�l����&g=à�Gy�B�=�#�Q�3�V�!���ӏ����	�2IW}��m�v=��>���*>�B�B�@� z�� �v�T�h��J	��t�j1(��m(���*T�k�i$�M����-�H���uC�̧ᗡ��9;�Qͭ�.ňn�ai�}ݺecie,�d;�Y����2�涺89C8���mCE@�Þ���}���9��!RE@8��� m��	�003�8�q���[=����K�x��0����% �>��Y��
{���ٛ��ba�X�1F��a�B�;�A<�TS�t	Z�O���8ŷ�+���'��ų���@K�ڻV��ie�����;�G���^�q��N�W#���[��}����dܖ�Wï^����G���k�������=<�wʯ�W�,T�`�3;�$!=1������������������v,_,8��Z��3=^� [��xu���'`��C.mK��>	�q$q="��w~��@O��$�!�Qw���ݴYJS�,��ŝ(�� �3����d,�;����ކ�^�r�MH��r���@�.͹�Z�&�m�͜3�����m�^^A�1��������D/S��k�$P����~q���x�p�[�"SH;�WrZ^�/L���h[Cs!���u���AZ�rp�]�g-��d,/�:q1�9��&!����I$!ﱿx7����z�:{�p��:h�a��D����eq��!����x��97�C "��i㻒��P� ����W���ɺ�bi.��t!�����������wZN��㋸�r�liP����*�����N` �"�04�6� ��J��Y�y������ʣ|LD:�bĜ+@,s��Z�-��� QP��U%r-��8s����-Pӽ��{&���.6Z�=Y)��re#��u�% �!R �A�*��
&��7�:�C���q:ق�}���v�4;N$�3&���'@�/d0�i�-pc�{���է�,���ǈo9��T�-B^6�3y�@ω�3�f@�?G�v���p� aĊh�Q�F�JJ4(�Р��)��)yQ��%��8J�Wܒ$�ܷ��*�A�<�9�9��;��M�<`�F+#�@��C�`��R!A82��(W|�l���G�0r,&˄z�E*��������tn�@�>N�#���D��f�����<�>�m(=;�>c`Fl�'��������@?l�A�~��>��pG"R &Tn'�M¢&0	����5W��!����($�t��'̅W�*7�3d1�*�	4 ~D`���N"(���Gh�~&�D�]��h�JCl7��T˷�I.�m��w?u�J)z�~�h.�XE�������)��}�}#m�#P2B����G ~�O��k2�����h,��}���=�� ݿ�>�Q*�>ݯh�-Ã:n���r���W�B��a�<���1�2j!��}����裔#�ϼy�OuϜ��`����+P ���D��(�����c�;�!`��
�������_@��VBƜDT|�t����5�⬵�j#QC���U����:/�b�9�3�h�)�F)'��I��6V+={�*��F@VG�+��R�A�	�f�౫xf��hV��	�O�}e��!1-U(��c�Kr�=N�Vx�!2Mh�q8gl���U�[�v�i%��{�f+o�1
�2p�����.�z�_�w$S�	+���