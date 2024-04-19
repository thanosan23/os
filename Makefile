bootloader.bin: bootloader.asm
	nasm bootloader.asm -f bin -o bootloader.bin

zeros.bin: zeros.asm bootloader.bin
	nasm zeros.asm -f bin -o zeros.bin

os.bin: bootloader.bin zeros.bin
	cat bootloader.bin zeros.bin > os.bin

run: os.bin
	qemu-system-i386 os.bin