build:
	nasm -fbin bootloader.asm -o bootloader.bin
	nasm -fbin kernel.asm -o kernel.bin

	cat bootloader.bin kernel.bin > e2mars-os.bin

run: build
	qemu-system-i386 e2mars-os.bin

flash:  build
	sudo dd if=e2mars-os.bin of=/dev/sdb

clean:
	rm -f *.bin