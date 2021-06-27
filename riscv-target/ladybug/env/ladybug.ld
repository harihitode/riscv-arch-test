OUTPUT_ARCH("riscv")

MEMORY {
  cram (rwx)  : ORIGIN = 0x00400000, LENGTH = 512k
  sigram (rx) : ORIGIN = 0x00500000, LENGTH = 4k
}
SECTIONS
{
  .text.init : { *(.text.init) } > cram
  . = ALIGN(0x1000);
  .tohost : { *(.tohost) } > cram
  . = ALIGN(0x1000);
  .text : { *(.text) } > cram
  . = ALIGN(0x1000);
  .data : { *(.data) } > cram
  .data.string : { *(.data.string) } > cram
  .bss : { *(.bss) } > cram
  .signature : { *(.signature) } > sigram
  _end = .;
}
