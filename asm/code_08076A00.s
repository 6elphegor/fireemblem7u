	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetScanLineHBlank
ResetScanLineHBlank: @ 0x08076A00
	push {r7, lr}
	mov r7, sp
	movs r0, #0
	bl SetOnHBlankA
	pop {r7}
	pop {r0}
	bx r0
