	.include "macro.inc"

	.syntax unified

	thumb_func_start VerifySaveBlockChecksum
VerifySaveBlockChecksum: @ 0x080A1998
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl SramChecksum32
	ldr r1, [r4, #0xc]
	cmp r1, r0
	bne _080A19B4
	movs r0, #1
	b _080A19B6
_080A19B4:
	movs r0, #0
_080A19B6:
	pop {r4, r5}
	pop {r1}
	bx r1
