	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08083C0C
sub_08083C0C: @ 0x08083C0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08083C40 @ =0x08CC2AAC
	bl Proc_Find
	adds r2, r4, #0
	adds r2, #0x59
	movs r1, #0
	strb r1, [r2]
	ldrh r2, [r0, #0x30]
	subs r2, #8
	adds r1, r4, #0
	adds r1, #0x50
	strb r2, [r1]
	ldrh r0, [r0, #0x32]
	subs r0, #8
	adds r1, #1
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	adds r1, #1
	bl DialogBoxGetGlyphLen
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083C40: .4byte 0x08CC2AAC
