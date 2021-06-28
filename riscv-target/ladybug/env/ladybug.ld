OUTPUT_ARCH("riscv")

MEMORY {
  cram (rwx)  : ORIGIN = 0x00400000, LENGTH = 2m
  sigram (rx) : ORIGIN = 0x00700000, LENGTH = 4k
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
