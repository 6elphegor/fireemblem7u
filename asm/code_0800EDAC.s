	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800EDAC
sub_0800EDAC: @ 0x0800EDAC
	push {lr}
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _0800EDBC
	movs r1, #0
	bl StartBgm
	b _0800EDC2
_0800EDBC:
	movs r0, #0x90
	bl SetBgmVolume
_0800EDC2:
	pop {r0}
	bx r0
	.align 2, 0
