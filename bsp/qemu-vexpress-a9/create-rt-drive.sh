RT_DISK=${HOME}/rt-disk

[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$(whoami)" "$@"
_USER=$1

RT_DISK=/home/${_USER}/rt-disk

if [ ! -d "$RT_DISK" ]; then
	mkdir -p $RT_DISK
	#chown ${_USER}:${_USER} ${RT_DISK}
fi

rm sd.bin
cp sd.bin_empty sd.bin

mount -t vfat sd.bin ${RT_DISK}
sudo cp packages/Lua_EOS-latest/target_files/* ${RT_DISK}
echo "********************************"
echo "*                              *"
echo "* Driver with following files: *"
echo "*                              *"
echo "********************************"
echo
ls ${RT_DISK}
umount ${RT_DISK}
chown -R ${_USER}:${_USER} sd.bin

