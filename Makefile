ASC=nasm 
ASFLAGS = -fbin

main.bin:main.asm readDisk.asm printf.asm printh.asm
	$(ASC) $(ASFLAGS) main.asm -o main.bin

run:
	qemu-system-x86_64 main.bin



